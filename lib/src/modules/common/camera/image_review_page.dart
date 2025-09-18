import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import '../../../utils/cam_image_picker_util.dart';
import '../app_texts.dart';

class ImageReviewPage extends StatefulWidget {
  const ImageReviewPage({
    required this.onSaveTap,
    required this.file,
    this.imagePath,
    // this.enforceCacheImageDelete = false,
  });

  final File? file;
  final String? imagePath;
  final void Function() onSaveTap;
  // final bool enforceCacheImageDelete;

  @override
  _ImageReviewPageState createState() => _ImageReviewPageState();
}

class _ImageReviewPageState extends BaseState<ImageReviewPage> {
  final _mainKey = GlobalKey();
  bool isCanvasEmpty = true;
  File? file;

  @override
  void initState() {
    super.initState();
    file = widget.file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: BaseAppBar(
        title: Text(AppTexts().kPreview),
      ),
      body: Center(
        child: ResponsiveContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 4,
                  //     color: Colors.red.withOpacityFactor(0.9),
                  //   ),
                  // ),
                  margin: EdgeInsets.symmetric(
                    // horizontal: 16,
                    vertical: 16,
                  ),
                  child: RepaintBoundary(
                    key: _mainKey,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.file(
                            file ??
                                File(
                                  widget.imagePath ?? "",
                                ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.kSmokyBlack,
                ),
              ),
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sync,
                      color: AppColors.kSmokyBlack,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppTexts().kRetake,
                      style: TextStyle(
                        color: AppColors.kSmokyBlack,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  await _openCamera();
                },
              ),
            ),
            if (file != null)
              Container(
                width: 100,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final croppedFile =
                        await ImageUtilsIr.getCroppedImage(file!);
                    if (croppedFile == null) {
                      return;
                    }

                    file = File(croppedFile.path);
                    setState(() {});
                  },
                  icon: const Icon(Icons.crop, size: 20, color: Colors.black87),
                  label: const Text(
                    "Crop",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.grey.shade100,
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: Colors.black87,
                  ),
                ),
              ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.kKeepGreen,
              ),
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: AppColors.kWhite,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Keep",
                      style: TextStyle(
                        color: AppColors.kWhite,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  if (checkIfNotEmpty(widget.imagePath) && file == null) {
                    Navigator.pop(
                      context,
                    );
                    return;
                  }
                  //NOT compressing the images for IR
                  // final _compressedDir =
                  //     await _imageUtils.getCompressedImagesDirectory();
                  // final _compressedImage = await _imageUtils.getCompressedImage(
                  //   file!,
                  //   _compressedDir,
                  //   enforceDelete: widget.enforceCacheImageDelete,
                  // );
                  Navigator.pop(context, file);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    File? returnedFile;

    returnedFile = await CameraImagePickerUtil().getImgFileFromCamera();

    if (returnedFile == null) {
      return;
    }

    setState(() {
      file = returnedFile;
    });
  }
}
