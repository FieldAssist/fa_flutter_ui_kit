import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show join;

import '../config/ui_common_colors.dart';
import '../config/ui_common_texts.dart';
import '../image_file_utils.dart';
import '../logger.dart';
import 'camera_host.dart';
import 'widgets/camera_switch_button.dart';
import 'widgets/image_capture_button.dart';

// A screen that allows users to take a picture using a given camera.
@RoutePage()
class CameraImagePage extends StatefulWidget {
  const CameraImagePage({
    this.showFrontCamera = false,
    this.geoImageWaterMark,
    this.isGeoImage = false,
    this.buttonText,
    this.showSwitchCameraButton = false,
    this.needImageCompressed = true,
    this.title,
    this.showZoomControls = false,
    this.useCunningScanner = false,
    Key? key,
  }) : super(key: key);

  final bool? showFrontCamera;
  final String? geoImageWaterMark;
  final bool isGeoImage;
  final String? buttonText;
  final String? title;
  final bool showSwitchCameraButton;
  final bool needImageCompressed;
  final bool showZoomControls;
  final bool useCunningScanner;

  @override
  CameraImagePageState createState() => CameraImagePageState();
}

class CameraImagePageState extends State<CameraImagePage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  CameraDescription? _frontCamera;
  CameraDescription? _backCamera;
  CameraDescription? _externalCamera;
  CameraDescription? _ultraWideCamera;

  List<CameraDescription> cameras = [];

  CameraDescription? _camera;
  bool _capturing = false;

  // Tap to focus state
  Offset? _focusPoint;
  Timer? _focusTimer;

  // Zoom state
  double _currentZoom = 1;
  double _minZoom = 1;
  double _maxZoom = 1;
  bool _isZoomSupported = false;
  bool _isUltraWideSupported = false;
  bool _isUltraWideActive = false;
  double _ultraWideZoom = 0.5;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(widget.title ?? UiCommonTexts().kTakePicture),
        actions: [
          if (widget.useCunningScanner)
            IconButton(
              icon: const Icon(Icons.document_scanner),
              tooltip: UiCommonTexts().kScanDocument,
              onPressed: _scanWithDocumentScanner,
            ),
        ],
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return UnknownErrorWidget(
              init,
              message: snapshot.error?.toString() ??
                  "${UiCommonTexts().errorSomethingWentWrong}",
              pop: false,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return StreamLoadingWidget();
          } else {
            // If the Future is complete, display the preview.
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) =>
                        _onTapToFocus(details),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: CameraPreview(_controller!),
                    ),
                  ),
                ),
                // Focus indicator
                if (_focusPoint != null)
                  Positioned(
                    left: _focusPoint!.dx - 40,
                    top: _focusPoint!.dy - 40,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: UiCommonColors.kLightGreen,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                // Zoom controls
                if (_isZoomSupported)
                  Positioned(
                    bottom: 35,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _buildZoomControls(),
                    ),
                  ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: (cameras.length < 2 ||
              !widget.showSwitchCameraButton)
          ? _imgCaptureBtn
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imgCaptureBtn,
                SizedBox(width: 40),
                CameraSwitchButton(
                  onPressed: () async {
                    _isUltraWideActive = false;
                    if (_camera == null) {
                      _camera = _backCamera ?? _externalCamera;
                      return initController();
                    }

                    if (cameras.length < 2) {
                      return;
                    }

                    if (_camera!.lensDirection == CameraLensDirection.back) {
                      _camera = _frontCamera ?? _externalCamera;
                    } else {
                      _camera = _backCamera ?? _externalCamera;
                    }
                    return initController();
                  },
                ),
              ],
            ),
    );
  }

  Future<void> init() async {
    // TODO(apgapg): to be removed in future
    if (isLinux || isMac || isWindows) {
      await attachDefaultImage();
    } else {
      await initCameras();
      await initCamera();
      await initController();
    }
  }

  Future<void> initCameras() async {
    cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw ArgumentError(UiCommonTexts().kNoCameraAvailable);
    }
    _frontCamera = cameras.firstWhereOrNull(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
    _backCamera = cameras.firstWhereOrNull(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );
    _externalCamera = cameras.firstWhereOrNull(
      (camera) => camera.lensDirection == CameraLensDirection.external,
    );
    if (Platform.isIOS) {
      try {
        final ultraWideId = await const MethodChannel('fa_camera_channel')
            .invokeMethod<String>('getUltraWideCameraId');
        if (ultraWideId != null) {
          _ultraWideCamera =
              cameras.firstWhereOrNull((c) => c.name == ultraWideId);
        }
      } catch (_) {}
    }
  }

  Future<void> initCamera() async {
    // To display the current output from the Camera,
    // create a CameraController.
    if (widget.showFrontCamera ?? false) {
      if (_frontCamera != null) {
        _camera = _frontCamera;
      } else if (_backCamera != null) {
        _camera = _backCamera;
      } else if (_externalCamera != null) {
        _camera = _externalCamera;
      } else {
        throw ArgumentError(UiCommonTexts().kNoCameraAvailable);
      }
    } else {
      if (_backCamera != null) {
        _camera = _backCamera;
      } else if (_frontCamera != null) {
        _camera = _frontCamera;
      } else if (_externalCamera != null) {
        _camera = _externalCamera;
      } else {
        throw ArgumentError(UiCommonTexts().kNoCameraAvailable);
      }
    }
  }

  CameraController getCameraController() =>
      CameraController(_camera!, ResolutionPreset.veryHigh);

  Future<void> initController() async {
    // Null out future first so FutureBuilder shows loading before dispose runs.
    // Without this, a frame between dispose() and the new setState() renders
    // CameraPreview against the already-disposed controller.
    final oldController = _controller;
    _controller = null;
    setState(() {
      _initializeControllerFuture = null;
    });
    if (oldController != null) {
      await oldController.dispose();
    }
    _controller = getCameraController();
    setState(() {
      _initializeControllerFuture = _controller!.initialize();
    });
    await _initializeControllerFuture;

    // Initialize zoom levels after controller is ready
    if (widget.showFrontCamera == false && widget.showZoomControls) {
      await _initializeZoom();
    }
  }

  Future<void> attachDefaultImage() async {
    await Future.delayed(const Duration(seconds: 1));
    final bytes = await rootBundle.load(Images.fieldAssistLogo);
    final list = bytes.buffer.asUint8List();
    final path = join(
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.jpg',
    );
    final file = File(path)..writeAsBytesSync(list);
    Navigator.pop(context, file);
  }

  /// Handles tap to focus functionality
  Future<void> _onTapToFocus(TapDownDetails details) async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      // Cancel previous timer if exists
      _focusTimer?.cancel();

      // Get the render box to calculate relative position
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      // Calculate the tap position relative to the camera preview
      // Account for the 8px margin
      final localPosition = details.localPosition;

      // Get the size of the preview area (accounting for margin)
      final size = renderBox.size;

      // Normalize coordinates (0.0 to 1.0)
      // The camera controller expects normalized coordinates
      final x = localPosition.dx / size.width;
      final y = localPosition.dy / size.height;

      // Clamp values to ensure they're within bounds
      final clampedX = x.clamp(0.0, 1.0);
      final clampedY = y.clamp(0.0, 1.0);

      // Set focus and exposure point
      final point = Offset(clampedX, clampedY);

      await _controller!.setFocusPoint(point);
      await _controller!.setExposurePoint(point);

      // Update UI to show focus indicator at tap position
      setState(() {
        _focusPoint = localPosition;
      });

      // Auto-hide the focus indicator after 2 seconds
      _focusTimer = Timer(Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _focusPoint = null;
          });
        }
      });
    } catch (e, s) {
      // Silently fail if camera doesn't support focus/exposure control
      // This prevents crashes on devices with limited camera capabilities
      faUiCommonLogger.e('Tap to focus error: $e', s);
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _focusTimer?.cancel();
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  Widget get _imgCaptureBtn => ImageCaptureButton(
        onTakePhoto: () async {
          if (_capturing || !mounted) {
            return;
          }
          _capturing = true;
          // Take the Picture in a try / catch bloc. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;
            await CommonProgressDialog.show(context);
            final _xFile = await _controller!.takePicture();
            final _annotatedImg = await _onTakePicture(_xFile, context);
            await CommonProgressDialog.hide();
            if (_annotatedImg == null) {
              Navigator.pop(context);
            }
            Navigator.pop(context, _annotatedImg);
          } catch (e, s) {
            faUiCommonLogger.e(e, s);
            // TODO(someshubham): Add toast here
            //ToastUtils.show(
            //   "Some error in capturing image!");
          }
          _capturing = false;
        },
        buttonText: widget.buttonText,
      );

  /// POC: capture via the ML Kit document scanner instead of the live camera.
  /// Reuses [_onTakePicture] so scaling/compression/watermark stay identical
  /// and the page returns the same processed [File] to its caller.
  Future<void> _scanWithDocumentScanner() async {
    try {
      final paths = await CunningDocumentScanner.getPictures(
        noOfPages: 1,
        scannerSource: ScannerSource.camera,
      );
      if (!checkIfListIsNotEmpty(paths) || !mounted) {
        return;
      }

      await CommonProgressDialog.show(context);
      final processedFile = await _onTakePicture(XFile(paths!.first), context);
      await CommonProgressDialog.hide();

      if (!mounted) {
        return;
      }
      Navigator.pop(context, processedFile);
    } catch (e, s) {
      await CommonProgressDialog.hide();
      faUiCommonLogger.e(e, s);
    }
  }

  Future<File?> _onTakePicture(
    XFile? xFile,
    BuildContext context,
  ) async {
    if (xFile == null) {
      return null;
    }

    var imageFile = File(xFile.path);

    try {
      // STEP 1: Scale image if it exceeds 8MP to prevent memory issues
      // This runs in isolate, so it won't block UI
      final compressedImageDir =
          await ImageFileUtils.getCompressedImagesDirectory();

      final scaledFile = await ImageFileUtils.scaleImageIfNeeded(
        imageFile,
        compressedImageDir,
        maxPixels: ImageFileUtils.maxImagePixels,
      );

      if (scaledFile != null) {
        imageFile = scaledFile;
      }

      // STEP 2: Compress image (only when needed)
      // This also runs in isolate for better performance
      if (widget.needImageCompressed) {
        final compressedFile = await ImageFileUtils.getCompressedImage(
          imageFile,
          compressedImageDir,
          enforceDelete: true,
        );

        if (compressedFile != null) {
          imageFile = compressedFile; // use compressed instead
        }
      }

      // STEP 3: Apply watermark only if geoImage
      // Watermark is already using isolate (existing implementation)
      if (widget.isGeoImage) {
        imageFile = await cameraHost.stampGeoImage(
          imageFile,
          widget.geoImageWaterMark,
        );
      }

      return imageFile;
    } catch (e, s) {
      faUiCommonLogger.e(e, s);
      // Clean up on error
      if (imageFile.existsSync()) {
        try {
          await imageFile.delete();
        } catch (_) {}
      }
      return null;
    }
  }

  /// Initialize zoom capabilities
  Future<void> _initializeZoom() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      _minZoom = await _controller!.getMinZoomLevel();
      _maxZoom = await _controller!.getMaxZoomLevel();

      // Check if zoom is supported (min != max)
      _isZoomSupported = _minZoom < _maxZoom;

      // Ultrawide: zoom-based (Android) OR separate camera description (iOS)
      _isUltraWideSupported = _minZoom < 1.0 || _ultraWideCamera != null;
      if (_minZoom < 1.0) {
        _ultraWideZoom = _minZoom;
      }

      if (_isZoomSupported) {
        // Start at 1x regardless of device min (ultrawide is opt-in)
        _currentZoom = 1.0.clamp(_minZoom, _maxZoom);
        await _controller!.setZoomLevel(_currentZoom);
      }

      if (mounted) {
        setState(() {});
      }
    } catch (e, s) {
      faUiCommonLogger.e('Zoom initialization error: $e', s);
      _isZoomSupported = false;
    }
  }

  /// Set zoom level with animation
  Future<void> _setZoom(double zoom) async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    if (!_isZoomSupported) {
      return;
    }

    // Clamp zoom to valid range
    final clampedZoom = zoom.clamp(_minZoom, _maxZoom);

    try {
      await _controller!.setZoomLevel(clampedZoom);
      if (mounted) {
        setState(() {
          _currentZoom = clampedZoom;
        });
      }
    } catch (e, s) {
      faUiCommonLogger.e('Zoom error: $e', s);
    }
  }

  /// Build zoom control slider with 0.25x intervals, range 1x to 5x.
  /// When device supports ultrawide (minZoom < 1.0), shows a toggle button.
  Widget _buildZoomControls() {
    const sliderMin = 1.0;
    const sliderMax = 5.0;
    const divisions = 16;

    // iOS uses description-based toggle; Android uses zoom < 1.0
    final isUltraWideActive =
        _ultraWideCamera != null ? _isUltraWideActive : _currentZoom < 1.0;
    // Clamp display value to slider range; ultrawide sits at leftmost
    final displayValue = _currentZoom.clamp(sliderMin, sliderMax);

    final ultraWideLabel = '${_ultraWideZoom.toStringAsFixed(1)}x';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: UiCommonColors.kBlack54,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ultrawide toggle button (only on supported devices)
          if (_isUltraWideSupported) ...[
            GestureDetector(
              onTap: () async {
                if (_ultraWideCamera != null) {
                  final goToUltraWide = !_isUltraWideActive;
                  setState(() => _isUltraWideActive = goToUltraWide);
                  _camera = goToUltraWide ? _ultraWideCamera : _backCamera;
                  await initController();
                } else {
                  await _setZoom(isUltraWideActive ? 1.0 : _ultraWideZoom);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isUltraWideActive
                      ? UiCommonColors.kWhite
                      : UiCommonColors.kTransparent,
                  border: Border.all(
                    color: isUltraWideActive
                        ? UiCommonColors.kWhite
                        : UiCommonColors.kWhite54,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  ultraWideLabel,
                  style: TextStyle(
                    color: isUltraWideActive
                        ? UiCommonColors.kBlack
                        : UiCommonColors.kWhite70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          // Min zoom label (1x)
          Text(
            '1x',
            style: TextStyle(
              color: isUltraWideActive
                  ? UiCommonColors.kWhite38
                  : UiCommonColors.kWhite70,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          // Zoom slider (1x to 5x)
          SizedBox(
            width: 150,
            child: Slider(
              value: displayValue,
              min: sliderMin,
              max: sliderMax,
              divisions: divisions,
              onChanged: (value) async {
                final snappedValue = (value * 4).round() / 4;
                // On iOS, sliding while ultra-wide is active → switch back to
                // main camera first, then apply the slider zoom.
                if (_isUltraWideActive && _ultraWideCamera != null) {
                  setState(() => _isUltraWideActive = false);
                  _camera = _backCamera;
                  await initController();
                }
                await _setZoom(snappedValue);
              },
              activeColor: UiCommonColors.kWhite,
              inactiveColor: UiCommonColors.kWhite30,
            ),
          ),
          const SizedBox(width: 8),
          // Current zoom value display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UiCommonColors.kWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_currentZoom.toStringAsFixed(
                _currentZoom == _currentZoom.toInt() ? 0 : 2,
              )}x',
              style: const TextStyle(
                color: UiCommonColors.kBlack,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
