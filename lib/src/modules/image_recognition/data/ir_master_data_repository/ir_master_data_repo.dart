import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model/ir_api_master_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';

abstract class IrMasterDataRepository {
  Future<List<IrApiMasterModel>> getIrMasterList();

  Future<void> prepareIrMaster(List<int> outletIds);

  Future<void> clearIrMasterList();

  Future<void> saveIrOutletAssetDetails(int outletId);

  Future<void> updateIrOutletAssetDetails(IrOutletAssetDetailsModel model);

  Future<List<IrOutletAssetDetailsModel>> getIrOutletAssetDetails(int outletId);

  Future<void> saveIrAssetDetails();

  Future<List<IrAssetsModel>> getIrAssetDetails();
}
