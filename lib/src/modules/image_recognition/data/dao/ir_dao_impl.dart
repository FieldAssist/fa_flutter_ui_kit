import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:sqflite/sqflite.dart' as sqf;

import '../../../../utils/log_utils.dart';
import '../../models/compliance_score_data.dart';
import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model.dart';
import '../../models/ir_master_model/ir_api_master_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';
import 'ir_dao.dart';

class IrDaoImpl extends IrDao {
  IrDaoImpl({
    required this.db,
  });

  final Database db;

  final StoreRef<String?, Map<String, Object?>> _irVisitStore =
      stringMapStoreFactory.store('image_recognition_store');

  final StoreRef<String?, Map<String, Object?>> _complianceScoresStore =
      stringMapStoreFactory.store('ir_compliance_score_store');

  final StoreRef<String?, Map<String, Object?>> _gatePassStore =
      stringMapStoreFactory.store('gate_pass_store');

  final _irMasterListStorage =
      stringMapStoreFactory.store('ir_master_list_storage');

  //change ir_list_asset_master_storage
  final _irListAssetMasterStorage =
      stringMapStoreFactory.store('ir_list_asset_master_storage');

  final _irOutletAssetDetailsStorage =
      stringMapStoreFactory.store('ir_outlet_asset_details_storage');

  // we are opening db here instead of getting the instance directly
  // so that the isolates db changes can also be reflected

  @override
  Future<void> saveAResponse(IrMasterModel visit) async {
    await _irVisitStore.record(visit.uniqueId).put(db, visit.toJson());
  }

  @override
  Future<List<IrMasterModel>> getAllResponses(int outletId) async {
    final list = await _irVisitStore.find(db);
    final result =
        list.map((item) => IrMasterModel.fromJson(item.value)).toList();
    final returnList =
        result.where((element) => element.outletId == outletId).toList();
    return returnList;
  }

  @override
  Future<List<IrMasterModel>> getAllResponsesOfIr() async {
    final list = await _irVisitStore.find(db);
    final result =
        list.map((item) => IrMasterModel.fromJson(item.value)).toList();
    final returnList = result;
    return returnList;
  }

  @override
  Future<List<IrMasterModel>> getSpecificAssetResponses({
    required int outletId,
    required int beatId,
    required int routeId,
    required int assetId,
    required int instanceNumber,
    int? equipmentId,
  }) async {
    final list = await _irVisitStore.find(db);
    final result =
        list.map((item) => IrMasterModel.fromJson(item.value)).toList();
    final returnList = result
        .where(
          (element) =>
              element.outletId == outletId &&
              element.beatId == beatId &&
              element.routeId == routeId &&
              element.assetId == assetId &&
              (element.equipmentId == equipmentId || equipmentId == null) &&
              element.instanceNumber == instanceNumber,
        )
        .toList()
      ..sort((a, b) => a.imageIndex.compareTo(b.imageIndex));
    return returnList;
  }

  @override
  Future<void> clear() async {
    await Future.wait([
      _irVisitStore.delete(db),
      _complianceScoresStore.delete(db),
      _gatePassStore.delete(db),
      _irMasterListStorage.delete(db),
      _irListAssetMasterStorage.delete(db),
      _irOutletAssetDetailsStorage.delete(db),
    ]);
  }

  @override
  Future<void> clearIrResponses({required int outletId}) async {
    final finder = Finder(filter: Filter.equals("OutletId", outletId));

    final deletedCount = await _irVisitStore.delete(db, finder: finder);

    logger.i("DeletionCount $deletedCount");
  }

  @override
  Future<void> saveComplianceScoreResponse(ComplianceScoreData data) async {
    await _complianceScoresStore
        .record(data.attendanceGuid)
        .put(db, data.toJson());
  }

  @override
  Future<ComplianceScoreData?> getComplianceScoreData({
    required String? attendanceId,
  }) async {
    if (attendanceId == null) {
      return null;
    }

    final snapshotRecord =
        await _complianceScoresStore.record(attendanceId).get(db);
    if (snapshotRecord != null) {
      return ComplianceScoreData.fromJson(snapshotRecord);
    }
    return null;
  }

  // @override
  // Future<void> saveOcrResponse(OcrDataRes response) async {
  //   await _gatePassStore.record(response.guid ?? '').put(db, response.toJson());
  //   logger.i("Response Saved");
  // }

  // @override
  // Future<OcrDataRes?> getOcrResponse(String guid) async {
  //   final res = await _gatePassStore.findFirst(
  //     db,
  //     finder: Finder(
  //       filter: Filter.equals('guid', guid),
  //     ),
  //   );
  //
  //   if (res == null) {
  //     return null;
  //   }
  //
  //   return OcrDataRes.fromJson(res.value);
  // }

  // @override
  // Future<void> updateOcrResponse(OcrDataRes response) async {
  //   await _gatePassStore
  //       .record(response.guid ?? '')
  //       .update(db, response.toJson());
  //
  //   logger.i("Response Updated for ${response.guid}");
  // }

  @override
  Future<void> saveIrMasterList(List<IrApiMasterModel> irMasterList) async {
    await _irMasterListStorage.delete(db);
    await _irMasterListStorage
        .records(irMasterList.map((model) => model.id.toString()))
        .put(db, irMasterList.map((item) => item.toJson()).toList());
  }

  @override
  Future<List<IrApiMasterModel>> getIrMasterList() async {
    final _irMasterList = await _irMasterListStorage.find(db);
    return _irMasterList
        .map((e) => IrApiMasterModel.fromJson(e.value))
        .toList();
  }

  @override
  Future<void> saveIrAssetDetailsList(
      List<IrAssetsModel> irAssetDetailList) async {
    await _irListAssetMasterStorage.delete(db);
    await _irListAssetMasterStorage
        .records(irAssetDetailList.map((model) => model.id.toString()))
        .put(db, irAssetDetailList.map((item) => item.toJson()).toList());
  }

  // get

  @override
  Future<List<IrAssetsModel>> getIrAssetDetailList() async {
    final _irAssetDetailList = await _irListAssetMasterStorage.find(db);
    return _irAssetDetailList
        .map((e) => IrAssetsModel.fromJson(e.value))
        .toList();
  }

  @override
  Future<void> saveIrOutletAssetDetails(
      List<IrOutletAssetDetailsModel> irOutletAssetDetailList,
      int outletId) async {
    await _irOutletAssetDetailsStorage.delete(db);
    await _irOutletAssetDetailsStorage
        .records(irOutletAssetDetailList.map((model) => model.id.toString()))
        .put(db, irOutletAssetDetailList.map((item) => item.toJson()).toList());
  }

  @override
  Future<void> updateIrOutletAssetDetails(
      IrOutletAssetDetailsModel outletAssetDetails) async {
    await _irOutletAssetDetailsStorage
        .record(outletAssetDetails.id.toString())
        .put(db, outletAssetDetails.toJson());
  }

  @override
  Future<List<IrOutletAssetDetailsModel>> getIrOutletAssetDetails(
      int outletId) async {
    final _irOutletAssetDetailList =
        await _irOutletAssetDetailsStorage.find(db);
    return _irOutletAssetDetailList
        .map((e) => IrOutletAssetDetailsModel.fromJson(e.value))
        .toList();
  }

  @override
  Future<void> updateIrResponse(IrMasterModel visit) async {
    await _irVisitStore.record(visit.uniqueId).put(
          db,
          visit.toJson(),
        );
  }
}
