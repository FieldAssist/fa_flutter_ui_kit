// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i5;

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_image_page.dart'
    as _i1;
import 'package:fa_flutter_ui_kit/src/ui_common/camera/image_review_page.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.CameraImagePage]
class CameraImagePageRoute extends _i3.PageRouteInfo<CameraImagePageRouteArgs> {
  CameraImagePageRoute({
    bool? showFrontCamera = false,
    String? geoImageWaterMark,
    bool isGeoImage = false,
    String? buttonText,
    bool showSwitchCameraButton = false,
    bool needImageCompressed = true,
    String? title,
    bool showZoomControls = false,
    bool useCunningScanner = false,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CameraImagePageRoute.name,
          args: CameraImagePageRouteArgs(
            showFrontCamera: showFrontCamera,
            geoImageWaterMark: geoImageWaterMark,
            isGeoImage: isGeoImage,
            buttonText: buttonText,
            showSwitchCameraButton: showSwitchCameraButton,
            needImageCompressed: needImageCompressed,
            title: title,
            showZoomControls: showZoomControls,
            useCunningScanner: useCunningScanner,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraImagePageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CameraImagePageRouteArgs>(
        orElse: () => const CameraImagePageRouteArgs(),
      );
      return _i1.CameraImagePage(
        showFrontCamera: args.showFrontCamera,
        geoImageWaterMark: args.geoImageWaterMark,
        isGeoImage: args.isGeoImage,
        buttonText: args.buttonText,
        showSwitchCameraButton: args.showSwitchCameraButton,
        needImageCompressed: args.needImageCompressed,
        title: args.title,
        showZoomControls: args.showZoomControls,
        useCunningScanner: args.useCunningScanner,
        key: args.key,
      );
    },
  );
}

class CameraImagePageRouteArgs {
  const CameraImagePageRouteArgs({
    this.showFrontCamera = false,
    this.geoImageWaterMark,
    this.isGeoImage = false,
    this.buttonText,
    this.showSwitchCameraButton = false,
    this.needImageCompressed = true,
    this.title,
    this.showZoomControls = false,
    this.useCunningScanner = false,
    this.key,
  });

  final bool? showFrontCamera;

  final String? geoImageWaterMark;

  final bool isGeoImage;

  final String? buttonText;

  final bool showSwitchCameraButton;

  final bool needImageCompressed;

  final String? title;

  final bool showZoomControls;

  final bool useCunningScanner;

  final _i4.Key? key;

  @override
  String toString() {
    return 'CameraImagePageRouteArgs{showFrontCamera: $showFrontCamera, geoImageWaterMark: $geoImageWaterMark, isGeoImage: $isGeoImage, buttonText: $buttonText, showSwitchCameraButton: $showSwitchCameraButton, needImageCompressed: $needImageCompressed, title: $title, showZoomControls: $showZoomControls, useCunningScanner: $useCunningScanner, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CameraImagePageRouteArgs) return false;
    return showFrontCamera == other.showFrontCamera &&
        geoImageWaterMark == other.geoImageWaterMark &&
        isGeoImage == other.isGeoImage &&
        buttonText == other.buttonText &&
        showSwitchCameraButton == other.showSwitchCameraButton &&
        needImageCompressed == other.needImageCompressed &&
        title == other.title &&
        showZoomControls == other.showZoomControls &&
        useCunningScanner == other.useCunningScanner &&
        key == other.key;
  }

  @override
  int get hashCode =>
      showFrontCamera.hashCode ^
      geoImageWaterMark.hashCode ^
      isGeoImage.hashCode ^
      buttonText.hashCode ^
      showSwitchCameraButton.hashCode ^
      needImageCompressed.hashCode ^
      title.hashCode ^
      showZoomControls.hashCode ^
      useCunningScanner.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i2.ImageReviewPage]
class ImageReviewPageRoute extends _i3.PageRouteInfo<ImageReviewPageRouteArgs> {
  ImageReviewPageRoute({
    required _i5.File? file,
    required bool isMultiShotMode,
    String? imagePath,
    bool enforceCacheImageDelete = false,
    bool enableRemarks = false,
    String initialRemark = '',
    _i4.ValueChanged<String>? onRemarksCaptured,
    _i2.RemarkEditorOpener? openRemarkEditor,
    _i2.MultiShotCaptureOpener? openMultiShotCapture,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ImageReviewPageRoute.name,
          args: ImageReviewPageRouteArgs(
            file: file,
            isMultiShotMode: isMultiShotMode,
            imagePath: imagePath,
            enforceCacheImageDelete: enforceCacheImageDelete,
            enableRemarks: enableRemarks,
            initialRemark: initialRemark,
            onRemarksCaptured: onRemarksCaptured,
            openRemarkEditor: openRemarkEditor,
            openMultiShotCapture: openMultiShotCapture,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageReviewPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageReviewPageRouteArgs>();
      return _i2.ImageReviewPage(
        file: args.file,
        isMultiShotMode: args.isMultiShotMode,
        imagePath: args.imagePath,
        enforceCacheImageDelete: args.enforceCacheImageDelete,
        enableRemarks: args.enableRemarks,
        initialRemark: args.initialRemark,
        onRemarksCaptured: args.onRemarksCaptured,
        openRemarkEditor: args.openRemarkEditor,
        openMultiShotCapture: args.openMultiShotCapture,
      );
    },
  );
}

class ImageReviewPageRouteArgs {
  const ImageReviewPageRouteArgs({
    required this.file,
    required this.isMultiShotMode,
    this.imagePath,
    this.enforceCacheImageDelete = false,
    this.enableRemarks = false,
    this.initialRemark = '',
    this.onRemarksCaptured,
    this.openRemarkEditor,
    this.openMultiShotCapture,
  });

  final _i5.File? file;

  final bool isMultiShotMode;

  final String? imagePath;

  final bool enforceCacheImageDelete;

  final bool enableRemarks;

  final String initialRemark;

  final _i4.ValueChanged<String>? onRemarksCaptured;

  final _i2.RemarkEditorOpener? openRemarkEditor;

  final _i2.MultiShotCaptureOpener? openMultiShotCapture;

  @override
  String toString() {
    return 'ImageReviewPageRouteArgs{file: $file, isMultiShotMode: $isMultiShotMode, imagePath: $imagePath, enforceCacheImageDelete: $enforceCacheImageDelete, enableRemarks: $enableRemarks, initialRemark: $initialRemark, onRemarksCaptured: $onRemarksCaptured, openRemarkEditor: $openRemarkEditor, openMultiShotCapture: $openMultiShotCapture}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageReviewPageRouteArgs) return false;
    return file == other.file &&
        isMultiShotMode == other.isMultiShotMode &&
        imagePath == other.imagePath &&
        enforceCacheImageDelete == other.enforceCacheImageDelete &&
        enableRemarks == other.enableRemarks &&
        initialRemark == other.initialRemark &&
        onRemarksCaptured == other.onRemarksCaptured &&
        openRemarkEditor == other.openRemarkEditor &&
        openMultiShotCapture == other.openMultiShotCapture;
  }

  @override
  int get hashCode =>
      file.hashCode ^
      isMultiShotMode.hashCode ^
      imagePath.hashCode ^
      enforceCacheImageDelete.hashCode ^
      enableRemarks.hashCode ^
      initialRemark.hashCode ^
      onRemarksCaptured.hashCode ^
      openRemarkEditor.hashCode ^
      openMultiShotCapture.hashCode;
}
