import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/file_repository/upload_meta_data_model/upload_meta_data_model.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_endpoints.dart';

import '../../data/remote/api_helper.dart';
import '../../utils/log_utils.dart';
import 'file_repository.dart';
import 'image_container_type.dart';

class FileRepositoryImpl implements FileRepository {
  const FileRepositoryImpl({
    required this.apiHelper,
  });

  final ApiHelper apiHelper;

  @override
  Future<Result<String>> uploadImage({
    required ImageContainer container,
    required String imageBase64,
    String? sessionId,
    bool enableFaceDetection = false,
  }) async {
    try {
      final postData = {
        "Container": container.name,
        "Image": imageBase64,
        "SessionId": sessionId,
        "EnableFaceDetect": enableFaceDetection
      };

      final res = await apiHelper.post(
        endpoint: ApiEndPoints.imageUpload(),
        body: jsonEncode(postData),
      );

      final String data = res.data;
      return Result.success(data: data);
    } catch (e, stk) {
      logger.e(e, stk);
      return Result.failure(reason: '$e');
    }
  }

  @override
  Future<Result<String>> uploadFile({required File file}) async {
    try {
      final res = await apiHelper.postFile(
        endpoint: ApiEndPoints.fileUpload(),
        file: file,
      );
      final String data = res.data;
      return Result.success(data: data);
    } catch (e, stk) {
      logger.e(e, stk);
      return Result.failure(reason: '$e');
    }
  }

  @override
  Future<Result<String>> uploadImageUsingMultiPart({
    required ImageContainer container,
    required File image,
  }) async {
    try {
      final res = await apiHelper.postFile(
        endpoint: ApiEndPoints.imageUploadMultipart(
          container.name.toLowerCase(),
        ),
        file: image,
      );

      final String data = res.data;
      return Result.success(data: data);
    } catch (e, stk) {
      logger.e(e, stk);
      return Result.failure(reason: '$e');
    }
  }

  @override
  Future<Result<String?>> uploadFileUsingSASToken({
    required File file,
    required UploadMetaDataModel uploadMetaData,
  }) async {
    //1. generate upload URL
    final url = await _getGeneratedUploadUrl(uploadMetaData);

    if (url == null) {
      throw MyException("Error in Generating Upload URL");
    }

    //2. upload data in url
    final isSuccess = await _uploadFileWithSASToken(
      url: url,
      file: file,
      contentType: uploadMetaData.contentType,
    );

    if (isSuccess) {
      //return new url
      final fileUrl = _getFileUrlFromSASUrl(url);
      logger.i("Uploaded Image url: $fileUrl");
      return Result.success(data: fileUrl);
    }

    return ResultFailure(reason: "Error in uploading file");
  }

  Future<String?> _getGeneratedUploadUrl(
    UploadMetaDataModel uploadMetaData,
  ) async {
    try {
      final response = await apiHelper.post(
        endpoint: ApiEndPoints.generateUploadUrl(),
        body: jsonEncode(uploadMetaData),
      );

      if (response.data != null) {
        return response.data['UploadUrl'];
      }
    } catch (e, s) {
      logger.e(e, s);
      return null;
    }
    return null;
  }

  Future<bool> _uploadFileWithSASToken({
    required String url,
    required File file,
    required String contentType,
  }) async {
    try {
      logger.d("--------------- Starting image upload.. ---------------");
      final dio = Dio();
      //Not adding logging interceptor as it fills the debug console with file chunk bytes
      // dio.interceptors.addAll([MyLoggingInterceptor()]);
      final response = await dio.put(
        url,
        data: file.readAsBytesSync(),
        options: Options(
          headers: {
            'X-ms-blob-type': 'BlockBlob', //DO NOT REMOVE THIS
          },
          contentType: contentType,
        ),
      );

      logger.d("--------------- Image upload completed.. ---------------");

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e, s) {
      logger.e(e, s);
      return false;
    }
  }

  String _getFileUrlFromSASUrl(String url) {
    return url.substring(0, url.indexOf('?'));
  }
}
