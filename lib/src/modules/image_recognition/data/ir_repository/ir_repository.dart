import '../../models/compliance_score_data.dart';
import '../../models/ir_master_model.dart';
import '../../models/ir_response_model.dart';
import '../../models/task_status.dart';

abstract class IrRepository {
  Future<List<IrMasterModel>> getAllResponses(int outletId);

  Future<void> saveAResponse(IrMasterModel visit);

  Future<List<IrMasterModel>> getAllResponsesOfIr();

  Future<void> updateIrResponse(
    IrMasterModel visit,
    TaskStatus status, {
    String? detectionId,
    String? uploadImageFailedReason,
    IrResponseModel? irResponseModel,
  });

  Future<ComplianceScoreData?> getComplianceScoreData({
    required String? sessionId,
    required String? attendanceId,
    required String outletId,
  });

  Future<void> clearIrResponses({required int outletId});

  Future<List<IrResponseModel>?> getIrDataForPrevVisit({
    String? sessionId,
    String? attendanceId,
    String? outletId,
  });

  Future<void> clearAllIrResponses();

  Future<List<IrMasterModel>> getSpecificAssetResponses({
    required int outletId,
    required int beatId,
    required int routeId,
    required int assetId,
    required int instanceNumber,
    int? equipmentId,
  });
}
