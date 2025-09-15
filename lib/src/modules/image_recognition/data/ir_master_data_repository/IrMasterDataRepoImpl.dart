import 'dart:convert';

import 'package:fa_flutter_ui_kit/src/data/remote/index.dart';

import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model/ir_api_master_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';
import '../dao/ir_dao.dart';
import 'ir_master_data_repo.dart';

class IrMasterDataRepositoryImpl implements IrMasterDataRepository {
  IrMasterDataRepositoryImpl({
    required this.apiHelper,
    required this.irDb,
  });

  final ApiHelper apiHelper;
  final IrDao irDb;

  @override
  Future<void> prepareIrMaster(List<int> outletIds) async {
    try {
      final response = await apiHelper.post(
        endpoint: ApiEndPoints.getIrMaster(),
        body: jsonEncode(outletIds),
      );
      final data = (response.data as List?) ?? [];
      await irDb.saveIrMasterList(
        // ignore: unnecessary_lambdas
        data.map((e) => IrApiMasterModel.fromJson(e)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveIrAssetDetails() async {
    try {
      final response = await apiHelper.get(
        endpoint: ApiEndPoints.getIrAssetDetails(),
      );
      final data = (response.data as List?) ?? [];

      await irDb.saveIrAssetDetailsList(
        // ignore: unnecessary_lambdas
        data.map((e) => IrAssetsModel.fromJson(e)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<IrAssetsModel>> getIrAssetDetails() async {
    return irDb.getIrAssetDetailList();
  }

  @override
  Future<void> saveIrOutletAssetDetails(int outletId) async {
    try {
      final response = await apiHelper.get(
        endpoint: ApiEndPoints.getIrOutletAssetDetails(outletId),
      );
      final data = (response.data as List?) ?? [];

      await irDb.saveIrOutletAssetDetails(
        // ignore: unnecessary_lambdas
        data.map((e) => IrOutletAssetDetailsModel.fromJson(e)).toList(),
        outletId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateIrOutletAssetDetails(
    IrOutletAssetDetailsModel model,
  ) async {
    await irDb.updateIrOutletAssetDetails(model);
  }

  @override
  Future<List<IrOutletAssetDetailsModel>> getIrOutletAssetDetails(
    int outletId,
  ) async {
    return irDb.getIrOutletAssetDetails(outletId);
  }

  @override
  Future<void> clearIrMasterList() async {
    await irDb.saveIrMasterList([]);
  }

  @override
  Future<List<IrApiMasterModel>> getIrMasterList() async {
    return irDb.getIrMasterList();
  }
}
