import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/ui_common_colors.dart';
import '../config/ui_common_texts.dart';
import '../image_file_utils.dart';
import 'camera_host.dart';
import 'camera_image_picker_util.dart';

/// Opens an editor for the image's remark. Injected so this page never
/// imports IR, which supplies its own sheet.
typedef RemarkEditorOpener = Future<void> Function({
  required BuildContext context,
  required String initialRemark,
  required bool readOnly,
  required ValueChanged<String> onSave,
});

/// Runs an alternative capture flow and returns the captured file, or null if
/// the user backed out. Injected for the same reason as [RemarkEditorOpener].
typedef MultiShotCaptureOpener = Future<File?> Function(BuildContext context);

@RoutePage()
class ImageReviewPage extends StatefulWidget {
  const ImageReviewPage({
    required this.file,
    required this.isMultiShotMode,
    this.imagePath,
    this.enforceCacheImageDelete = false,
    this.enableRemarks = false,
    this.initialRemark = '',
    this.onRemarksCaptured,
    this.openRemarkEditor,
    this.openMultiShotCapture,
  })  : assert(
          !enableRemarks || openRemarkEditor != null,
          'enableRemarks needs an openRemarkEditor to open.',
        ),
        assert(
          !isMultiShotMode || openMultiShotCapture != null,
          'isMultiShotMode needs an openMultiShotCapture to capture with.',
        );

  final File? file;
  final String? imagePath;
  final bool enforceCacheImageDelete;
  final bool isMultiShotMode;
  final bool enableRemarks;
  final String initialRemark;
  final ValueChanged<String>? onRemarksCaptured;

  /// Supplied by the caller when [enableRemarks] is set.
  final RemarkEditorOpener? openRemarkEditor;

  /// Supplied by the caller when [isMultiShotMode] is set.
  final MultiShotCaptureOpener? openMultiShotCapture;

  @override
  _ImageReviewPageState createState() => _ImageReviewPageState();
}

class _ImageReviewPageState extends BaseState<ImageReviewPage> {
  File? file;
  String _remarks = '';
  final _transformationController = TransformationController();

  static const double _minScale = 1;
  static const double _scaleFactor = 0.5;

  Size? _naturalImageSize;
  Size? _containerSize;

  @override
  void initState() {
    super.initState();
    file = widget.file;
    _remarks = widget.initialRemark;
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolveImageSize());
  }

  bool get _canEditRemarks => file != null;

  Future<void> _openRemarksSheet() async {
    final open = widget.openRemarkEditor;
    if (open == null) {
      return;
    }
    await open(
      context: context,
      initialRemark: _remarks,
      readOnly: !_canEditRemarks,
      onSave: (value) {
        if (!mounted) {
          return;
        }
        setState(() => _remarks = value);
      },
    );
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  double get _maxScale => widget.isMultiShotMode ? 8.0 : 5.0;

  void _zoomIn() {
    HapticFeedback.lightImpact();
    final scale = _transformationController.value.getMaxScaleOnAxis();
    if (scale < _maxScale) {
      final s = (scale + _scaleFactor).clamp(_minScale, _maxScale);
      _transformationController.value = Matrix4.diagonal3Values(s, s, 1);
    }
  }

  void _zoomOut() {
    HapticFeedback.lightImpact();
    final scale = _transformationController.value.getMaxScaleOnAxis();
    if (scale > _minScale) {
      final s = (scale - _scaleFactor).clamp(_minScale, _maxScale);
      _transformationController.value = Matrix4.diagonal3Values(s, s, 1);
    }
  }

  void _resolveImageSize() {
    final previewFile = file ?? File(widget.imagePath ?? '');
    final provider = FileImage(previewFile);
    final stream = provider.resolve(const ImageConfiguration());
    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (info, _) {
        stream.removeListener(listener);
        if (!mounted) {
          return;
        }
        _naturalImageSize = Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        );
        _centerImage();
      },
      onError: (_, __) => stream.removeListener(listener),
    );
    stream.addListener(listener);
  }

  void _centerImage() {
    if (_naturalImageSize == null || _containerSize == null) {
      return;
    }
    final imageAR = _naturalImageSize!.width / _naturalImageSize!.height;
    final displayedWidth = _containerSize!.height * imageAR;
    if (displayedWidth >= _containerSize!.width) {
      return;
    }
    final dx = (_containerSize!.width - displayedWidth) / 2;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _transformationController.value = Matrix4.translationValues(dx, 0, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: BaseAppBar(
        title: Text(UiCommonTexts().kPreview),
      ),
      body: Center(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned.fill(child: _buildImagePreview()),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: _buildZoomControls(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CircleAction(
                  label: UiCommonTexts().kRetake,
                  icon: Icons.rotate_left,
                  foreground: cameraHost.primaryColor,
                  background: UiCommonColors.kWhite,
                  border: cameraHost.primaryColor,
                  onTap: _openCamera,
                ),
                if (widget.enableRemarks &&
                    (file != null || _remarks.isNotEmpty)) ...[
                  const SizedBox(width: 24),
                  _CircleAction(
                    label: UiCommonTexts().kRemarks,
                    icon: Icons.chat_outlined,
                    foreground: UiCommonColors.kGreyE,
                    background: UiCommonColors.kGreyQ,
                    // A remark exists: the dot says so without opening the
                    // sheet, the way an unread badge would.
                    showDot: _remarks.isNotEmpty,
                    onTap: _openRemarksSheet,
                  ),
                ],
                if (file != null) ...[
                  const SizedBox(width: 24),
                  _CircleAction(
                    label: UiCommonTexts().kCrop,
                    icon: Icons.crop,
                    foreground: UiCommonColors.kGreyE,
                    background: UiCommonColors.kGreyQ,
                    onTap: _cropImage,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              // Transparent button over an Ink fill so the tenant gradient (or
              // primary colour when none is configured) shows through.
              child: Ink(
                decoration: BoxDecoration(
                  gradient: cameraHost.primaryGradient,
                  color: cameraHost.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton.icon(
                  onPressed: _keepImage,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: UiCommonColors.kWhite,
                    backgroundColor: UiCommonColors.kTransparent,
                    shadowColor: UiCommonColors.kTransparent,
                    elevation: 0,
                    // minimumSize, never a fixed height, so accessibility text
                    // scaling can grow the button instead of clipping its label.
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.check, size: 20),
                  label: Text(
                    UiCommonTexts().kKeep,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZoomControls() {
    return Material(
      color: UiCommonColors.kWhite.withValues(alpha: 0.85),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _zoomIn,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.add, size: 20, color: cameraHost.primaryColor),
            ),
          ),
          const Divider(height: 1, color: UiCommonColors.kGreyM),
          InkWell(
            onTap: _zoomOut,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child:
                  Icon(Icons.remove, size: 20, color: UiCommonColors.kBlackA),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _cropImage() async {
    final croppedFile = await ImageFileUtils.getCroppedImage(file!);
    if (croppedFile == null) {
      return;
    }

    _naturalImageSize = null;
    _transformationController.value = Matrix4.identity();
    file = File(croppedFile.path);
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolveImageSize());
  }

  Future<void> _keepImage() async {
    if (file == null) {
      Navigator.pop(context);
      return;
    }

    final compressedDir = await ImageFileUtils.getCompressedImagesDirectory();
    final compressedImage = await ImageFileUtils.getCompressedImage(
      file!,
      compressedDir,
      enforceDelete: widget.enforceCacheImageDelete,
      quality: 85,
    );
    if (widget.enableRemarks) {
      widget.onRemarksCaptured?.call(_remarks);
    }
    if (!mounted) {
      return;
    }
    Navigator.pop(context, compressedImage);
  }

  Widget _buildImagePreview() {
    final previewFile = file ?? File(widget.imagePath ?? "");

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          _containerSize = Size(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          final ch = constraints.maxHeight;
          return SizedBox.expand(
            child: InteractiveViewer(
              constrained: false,
              panAxis: PanAxis.horizontal,
              minScale: _minScale,
              maxScale: _maxScale,
              transformationController: _transformationController,
              child: Image(
                image: FileImage(previewFile),
                height: ch,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openCamera() async {
    File? returnedFile;

    final openMultiShot = widget.openMultiShotCapture;
    if (widget.isMultiShotMode && openMultiShot != null) {
      returnedFile = await openMultiShot(context);
    } else {
      returnedFile = await CameraImagePickerUtil().getImgFileFromCamera(
        useInAppCamera: true,
        context: context,
      );
    }

    if (returnedFile == null) {
      return;
    }

    _naturalImageSize = null;
    _transformationController.value = Matrix4.identity();
    setState(() {
      file = returnedFile;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolveImageSize());
  }
}

/// One round action under the preview: a 56dp disc with its label beneath.
/// [border] draws a ring instead of a fill; [showDot] adds the remark badge.
class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.label,
    required this.icon,
    required this.foreground,
    required this.background,
    required this.onTap,
    this.border,
    this.showDot = false,
  });

  final String label;
  final IconData icon;
  final Color foreground;
  final Color background;
  final Color? border;
  final bool showDot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: background,
              shape: CircleBorder(
                side: border == null
                    ? BorderSide.none
                    : BorderSide(color: border!, width: 1.5),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(icon, size: 24, color: foreground),
                ),
              ),
            ),
            if (showDot)
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: UiCommonColors.kKeepGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: foreground,
          ),
        ),
      ],
    );
  }
}
