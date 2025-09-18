import 'dart:convert';
import 'dart:io';

import 'package:fa_flutter_api_client/fa_flutter_api_client.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';

import '../../../core/file_repository/file_repository.dart';
import '../../../core/file_repository/image_container_type.dart';
import '../../../core/file_repository/upload_meta_data_model/upload_meta_data_model.dart';
import '../../../data/remote/api_endpoints.dart';
import '../../../utils/log_utils.dart';
import '../data/ir_repository/ir_repository.dart';
import '../models/detection_response_data.dart';
import '../models/ir_image_quality/ir_image_quality.dart';
import '../models/ir_master_model.dart';
import '../models/ir_request_model.dart';
import '../models/ir_response_master_model.dart';
import '../models/ir_response_model.dart';
import '../models/task_status.dart';

class ImageRecognitionService {
  ImageRecognitionService({
    required this.apiHelper,
    required this.irRepository,
    required this.fileRepository,
  });

  final ApiService apiHelper;
  final IrRepository irRepository;
  final FileRepository fileRepository;

  Future<void> processImageRecognition(IrMasterModel visit) async {
    try {
      // Process image upload and recognition
      final detectionId = await _uploadImage(apiHelper, visit);
      if (detectionId == null) {
        return;
      }
      // Wait for recognition results
      await _getRecognitionResults(apiHelper, visit, detectionId);
    } catch (e, s) {
      logger.e(e, s);
      await irRepository.updateIrResponse(visit, TaskStatus.fail);
    }
  }

  Future<void> processImageRecognitionV2(IrMasterModel visit) async {
    try {
      final imageUploadRequest = await fileRepository.uploadFileUsingSASToken(
        file: File(visit.localFilePath),
        uploadMetaData: UploadMetaDataModel(
          container: ImageContainer.imageRecognition.value,
          contentType: 'image/jpeg',
        ),
      );

      await imageUploadRequest.when(
        success: (imageUrl) async {
          // check image quality
          if (imageUrl != null) {
            final imageQualityModel = await ImageUtils.checkImageQuality(
              apiHelper: apiHelper,
              imageUrl: imageUrl,
              isOcr: false,
            );

            if (imageQualityModel.isInvalid ||
                checkIfListIsNotEmpty(imageQualityModel.errors)) {
              await irRepository.updateIrResponse(
                visit,
                TaskStatus.fail,
                uploadImageFailedReason: imageQualityModel.errors?.first,
              );
            } else {
              // image detection api
              final detectionRes = await apiHelper.post(
                endpoint: ApiEndPoints.irImageDetect(),
                body: jsonEncode(
                  (visit.irRequestModel ?? IrRequestModel())
                      .copyWith(imageUrl: imageUrl),
                ),
              );

              if (detectionRes.data != null) {
                final data = IrResponseModel.fromJson(detectionRes.data);
                await irRepository.updateIrResponse(
                  visit,
                  TaskStatus.completed,
                  irResponseModel: data,
                );
                return;
              } else {
                await irRepository.updateIrResponse(
                  visit,
                  TaskStatus.fail,
                  uploadImageFailedReason: "${detectionRes.data}",
                );
              }
            }
          } else {
            await irRepository.updateIrResponse(visit, TaskStatus.fail);
            throw Exception("Uploaded Image url is null");
          }
        },
        failure: (err) async {
          await irRepository.updateIrResponse(visit, TaskStatus.fail,
              uploadImageFailedReason: err);
        },
      );
    } catch (e, s) {
      await irRepository.updateIrResponse(visit, TaskStatus.fail,
          uploadImageFailedReason: "$e");
      logger.e(e, s);
    }
  }

  Future<String?> _uploadImage(
      ApiService apiHelper, IrMasterModel visit) async {
    for (var count = 0; count < 4; count++) {
      try {
        final response = await apiHelper.postFile(
          keyName: "image",
          endpoint: ApiEndPoints.uploadImageIr(),
          file: File(visit.localFilePath),
          dataParameters: {
            'data': jsonEncode((visit.irRequestModel ?? IrRequestModel()))
          },
        );

        if (response.data != null) {
          final data = DetectionResponseData.fromJson(response.data!);
          if (data.success) {
            await irRepository.updateIrResponse(
              visit,
              TaskStatus.pending,
              detectionId: data.data,
            );
            return data.data;
          } else {
            await irRepository.updateIrResponse(
              visit,
              TaskStatus.fail,
              uploadImageFailedReason: data.message,
            );
            return null;
          }
        }
      } catch (e, s) {
        logger.e(e, s);
        if (count == 3) {
          await irRepository.updateIrResponse(visit, TaskStatus.fail);
          return null;
        }
      }
      await Future.delayed(const Duration(seconds: 3));
    }
    return null;
  }

  Future<void> _getRecognitionResults(
    ApiService apiHelper,
    IrMasterModel visit,
    String detectionId,
  ) async {
    // Intentional delay to give time to backend to process the image
    await Future.delayed(const Duration(seconds: 3));

    final maxRetries = visit.isForPlanogram ? 10 : 4;
    final delayInSeconds = visit.isForPlanogram ? 5 : 3;

    for (var count = 0; count < maxRetries; count++) {
      try {
        final response = await apiHelper.get(
          endpoint: ApiEndPoints.getIrImageResponse(detectionId),
        );

        if (response.data != null) {
          final data = IrResponseMasterModel.fromJson(response.data!);
          if (data.success) {
            await irRepository.updateIrResponse(
              visit,
              TaskStatus.completed,
              irResponseModel: data.irResponseMasterModel,
            );
            return;
          }
        }
      } catch (e, s) {
        logger.e(e, s);
      }

      if (count < maxRetries - 1) {
        await Future.delayed(Duration(seconds: delayInSeconds));
      }
    }

    // If we get here, all retries failed
    await irRepository.updateIrResponse(visit, TaskStatus.fail);
  }
}

class ImageUtils {
  static Future<IrImageQualityModel> checkImageQuality({
    required ApiService apiHelper,
    required String imageUrl,
    required bool isOcr,
  }) async {
    try {
      final res = await apiHelper.get(
        endpoint: "ImageQuality/check?imageUrl=$imageUrl?isOcr=$isOcr",
      );

      if (res.data != null) {
        return IrImageQualityModel.fromJson(res.data);
      }
    } catch (e, s) {
      logger.e(e, s);
      rethrow;
    }

    throw Exception("Something went wrong");
  }
}
