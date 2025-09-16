import '../../models/compliance_score_data.dart';
import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model.dart';
import '../../models/ir_master_model/ir_api_master_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';

abstract class IrDao {
  Future<void> saveAResponse(IrMasterModel visit);

  Future<List<IrMasterModel>> getAllResponses(int outletId);

  Future<List<IrMasterModel>> getAllResponsesOfIr();

  Future<List<IrMasterModel>> getSpecificAssetResponses({
    required int outletId,
    required int beatId,
    required int routeId,
    required int assetId,
    required int instanceNumber,
    int? equipmentId,
  });

  Future<void> updateIrResponse(
    IrMasterModel visit,
  );

  Future<void> clearIrResponses({required int outletId});

  Future<void> saveComplianceScoreResponse(ComplianceScoreData data);

  Future<ComplianceScoreData?> getComplianceScoreData({
    required String? attendanceId,
  });

  // Future<void> saveOcrResponse(OcrDataRes response);
  //
  // Future<OcrDataRes?> getOcrResponse(String guid);
  //
  // Future<void> updateOcrResponse(OcrDataRes response);

  Future<List<IrApiMasterModel>> getIrMasterList();

  Future<void> saveIrMasterList(List<IrApiMasterModel> irMasterList);

  Future<void> saveIrAssetDetailsList(List<IrAssetsModel> irAssetDetailList);

  Future<List<IrAssetsModel>> getIrAssetDetailList();

  // getOutletAssetDetails
  Future<void> saveIrOutletAssetDetails(
    List<IrOutletAssetDetailsModel> outletAssetDetails,
    int outletId,
  );

  Future<void> updateIrOutletAssetDetails(
    IrOutletAssetDetailsModel outletAssetDetails,
  );

  Future<List<IrOutletAssetDetailsModel>> getIrOutletAssetDetails(int outletId);

  Future<void> clear();
}
