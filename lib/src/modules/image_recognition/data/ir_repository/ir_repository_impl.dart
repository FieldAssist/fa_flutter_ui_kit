import 'dart:convert';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import '../../../../data/remote/api_helper.dart';
import '../../models/ir_response_model.dart';
import '../../models/task_status.dart';
import '../dao/ir_dao.dart';
import '../../../../data/remote/api_endpoints.dart';
import '../../../../utils/log_utils.dart';
import '../../models/compliance_score_data.dart';
import '../../models/ir_master_model.dart';
import 'ir_repository.dart';

class IrRepositoryImpl extends IrRepository {
  IrRepositoryImpl({
    required this.irDao,
    required this.apiHelper,
  });

  final IrDao irDao;
  final ApiHelper apiHelper;

  @override
  Future<List<IrMasterModel>> getAllResponses(int outletId) async {
    return irDao.getAllResponses(outletId);
  }

  @override
  Future<void> saveAResponse(IrMasterModel visit) async {
    await irDao.saveAResponse(visit);
  }

  @override
  Future<List<IrMasterModel>> getAllResponsesOfIr() async {
    return irDao.getAllResponsesOfIr();
  }

  @override
  Future<ComplianceScoreData?> getComplianceScoreData({
    required String? sessionId,
    required String? attendanceId,
    required String outletId,
  }) async {
    try {
      if (attendanceId != null) {
        final complianceScores =
            await irDao.getComplianceScoreData(attendanceId: attendanceId);
        if (complianceScores != null) {
          return complianceScores;
        }
      }
      final response = await apiHelper.post(
        endpoint: ApiEndPoints.getComplianceScoreData(
          sessionId,
          attendanceId,
          outletId,
        ),
      );
      final data = response.data;
      if (data != null) {
        final complianceScores =
            ComplianceScoreData.fromJson(response.data).copyWith(
          attendanceGuid: attendanceId,
        );
        if (attendanceId != null) {
          //we save the response to db only when attendance Id is not null
          //in case the attendanceId is passed null then the api returns avg scores of last 10 visits
          await irDao.saveComplianceScoreResponse(complianceScores);
        }
        return complianceScores;
      }
    } catch (e, s) {
      logger.e(e, s);
    }
    return null;
  }

  @override
  Future<void> clearIrResponses({required int outletId}) async {
    // logger.i("Clearing for $outletId");
    await irDao.clearIrResponses(outletId: outletId);
  }

  @override
  Future<void> clearAllIrResponses() async {
    await irDao.clear();
  }

  @override
  Future<List<IrResponseModel>?> getIrDataForPrevVisit({
    String? sessionId,
    String? attendanceId,
    String? outletId,
  }) async {
    try {
      final response = await apiHelper.get(
        endpoint: ApiEndPoints.getIrResultsForPreviousVisits(
          sessionId,
          attendanceId,
          outletId,
        ),
      );
      final data = response.data as List?;
      if (checkIfListIsNotEmpty(data)) {
        return data!
            .map((e) => IrResponseModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (e, s) {
      logger.e(e, s);
    }
    return null;
  }

  @override
  Future<List<IrMasterModel>> getSpecificAssetResponses({
    required int outletId,
    required int beatId,
    required int routeId,
    required int assetId,
    required int instanceNumber,
    int? equipmentId,
  }) {
    return irDao.getSpecificAssetResponses(
      outletId: outletId,
      beatId: beatId,
      routeId: routeId,
      assetId: assetId,
      instanceNumber: instanceNumber,
    );
  }

  @override
  Future<void> updateIrResponse(
    IrMasterModel visit,
    TaskStatus status, {
    String? detectionId,
    String? uploadImageFailedReason,
    IrResponseModel? irResponseModel,
  }) async {
    var updatedVisit = visit;
    if (detectionId != null) {
      updatedVisit = updatedVisit.copyWith(detectionId: detectionId);
    }
    if (uploadImageFailedReason != null) {
      updatedVisit = updatedVisit.copyWith(
        uploadImageFailedReason: uploadImageFailedReason,
      );
    }
    if (irResponseModel != null) {
      updatedVisit = updatedVisit.copyWith(irResponseModel: irResponseModel);
    }

    await irDao.updateIrResponse(updatedVisit.copyWith(syncStatus: status));
  }
}
