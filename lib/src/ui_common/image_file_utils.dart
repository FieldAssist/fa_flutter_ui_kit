import 'dart:io';
import 'dart:isolate';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';

import 'logger.dart';

class ImageDimensions {
  ImageDimensions({
    required this.width,
    required this.height,
    required this.pixels,
  });
  final int width;
  final int height;
  final int pixels;
}

/// File-based image helpers: the compressed-images directory, compression,
/// cropping and down-scaling.
class ImageFileUtils {
  ImageFileUtils._();

  /// Maximum pixels for captured images (8MP)
  /// 8MP is optimal balance for:
  /// - Image recognition quality
  /// - Memory efficiency on low-end devices
  static const int maxImagePixels = 8 * 1024 * 1024; // 8 million pixels

  static Future<Directory> getCompressedImagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();

    final compressedImageDir = Directory('${appDir.path}/compressed_images');
    if (!compressedImageDir.existsSync()) {
      compressedImageDir.createSync();
    }
    return compressedImageDir;
  }

  static Future<File?> getCompressedImage(
    File xFile,
    Directory compressedImageDir, {
    int quality = 60,
    bool enforceDelete = false,
  }) async {
    try {
      final comprssesedFile = await FlutterImageCompress.compressAndGetFile(
        xFile.path,
        "${compressedImageDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg",
        quality: quality,
      );

      if (enforceDelete) {
        if (xFile.existsSync()) {
          await xFile.delete();
        }
      }

      if (comprssesedFile != null) {
        return File(comprssesedFile.path);
      }

      return null;
    } catch (e, stk) {
      faUiCommonLogger.e(e, stk);
      return null;
    }
  }

  static Future<CroppedFile?> getCroppedImage(File file) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      compressQuality: 100,
      maxWidth: 1080,
      maxHeight: 1920,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          lockAspectRatio: false,
          hideBottomControls: false,
          initAspectRatio: CropAspectRatioPreset.original,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          doneButtonTitle: 'Save',
          cancelButtonTitle: 'Cancel',
          hidesNavigationBar: false,
        ),
      ],
    );

    if (cropped != null) {
      if (file.existsSync()) {
        file.deleteSync();
      }
    }

    return cropped;
  }

  /// Get image dimensions without loading full image into memory
  /// This is much faster and memory-efficient than decoding the entire image
  static Future<ImageDimensions?> getImageDimensions(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) {
        return null;
      }

      return ImageDimensions(
        width: image.width,
        height: image.height,
        pixels: image.width * image.height,
      );
    } catch (e, s) {
      faUiCommonLogger.e(e, s);
      return null;
    }
  }

  /// Scale image down if it exceeds maximum pixel count
  /// Returns scaled file or original if no scaling needed
  static Future<File?> scaleImageIfNeeded(
    File imageFile,
    Directory outputDir, {
    int maxPixels = maxImagePixels,
  }) async {
    try {
      final dims = await getImageDimensions(imageFile);
      if (dims == null) {
        return imageFile;
      }

      // If image is within limits, return original
      if (dims.pixels <= maxPixels) {
        faUiCommonLogger
            .i('Image within size limits: ${dims.width}x${dims.height}');
        return imageFile;
      }

      // Calculate scale factor to fit within maxPixels
      final scaleFactor = (maxPixels / dims.pixels).clamp(0.1, 1.0);
      final newWidth = (dims.width * scaleFactor).round();
      final newHeight = (dims.height * scaleFactor).round();

      faUiCommonLogger.i(
        'Scaling image from ${dims.width}x${dims.height} '
        'to ${newWidth}x$newHeight',
      );

      // Use isolate for scaling to avoid blocking UI
      final scaledFile = await Isolate.run(() async {
        final bytes = await imageFile.readAsBytes();
        final image = img.decodeImage(bytes);
        if (image == null) {
          return null;
        }

        // High-quality scaling
        final resized = img.copyResize(
          image,
          width: newWidth,
          height: newHeight,
          interpolation: img.Interpolation.linear,
        );

        final outputPath =
            '${outputDir.path}/scaled_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final outputFile = File(outputPath);
        await outputFile.writeAsBytes(img.encodeJpg(resized, quality: 90));

        return outputFile;
      });

      // Delete original oversized file
      if (scaledFile != null && imageFile.existsSync()) {
        await imageFile.delete();
      }

      return scaledFile;
    } catch (e, s) {
      faUiCommonLogger.e(e, s);
      return imageFile; // Return original on error
    }
  }
}
