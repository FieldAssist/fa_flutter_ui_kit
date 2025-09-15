import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/file_repository/upload_meta_data_model/upload_meta_data_model.dart';

import 'image_container_type.dart';

abstract class FileRepository {
  Future<Result<String>> uploadImage({
    required ImageContainer container,
    required String imageBase64,
    String? sessionId,
    bool enableFaceDetection = false,
  });

  Future<Result<String>> uploadFile({
    required File file,
  });

  Future<Result<String>> uploadImageUsingMultiPart({
    required ImageContainer container,
    required File image,
  });

  Future<Result<String?>> uploadFileUsingSASToken({
    required File file,
    required UploadMetaDataModel uploadMetaData,
  });
}
