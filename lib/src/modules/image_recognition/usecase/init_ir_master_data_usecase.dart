import 'package:fa_flutter_ui_kit/src/modules/image_recognition/bloc/ir_bloc.dart';

import '../../../data/remote/api_helper.dart';
import '../data/dao/ir_dao.dart';
import '../data/ir_master_data_repository/IrMasterDataRepoImpl.dart';
import '../data/ir_master_data_repository/ir_master_data_repo.dart';
import '../data/ir_repository/ir_repository.dart';

/// Use-case that performs **all** master-data initialisation required for
/// Image-Recognition (IR).
/// Usage:
///   final usecase = InitIrMasterDataUsecase(irMasterRepo);
///   await usecase(outletIds);

class InitIrMasterDataUseCase {
  InitIrMasterDataUseCase({
    required this.apiHelper,
    required this.irDao,
    required this.irBloc,
  });

  final ApiHelper apiHelper;

  final IrDao irDao;

  final IrBloc irBloc;

  late final IrMasterDataRepository _irMasterRepo;

  /// [outletIds] – IDs of outlets whose IR master data must be fetched.
  Future<void> call(List<int> outletIds) async {
    _irMasterRepo = IrMasterDataRepositoryImpl(
      apiHelper: apiHelper,
      irDb: irDao,
    );

    // 1. Pull master-rules & per-outlet configs
    await _irMasterRepo.prepareIrMaster(outletIds);

    //Load data in memory
    irBloc.irEnabledMasterDataList = await _irMasterRepo.getIrMasterList();

    // 2. Pull static asset definitions
    await _irMasterRepo.saveIrAssetDetails();

    // 3. (Optional) Cache outlet-specific asset mapping
    for (final id in outletIds) {
      await _irMasterRepo.saveIrOutletAssetDetails(id);
    }
  }

  Future<void> clearIrMasterData() {
    return _irMasterRepo.clearIrMasterList();
  }
}
