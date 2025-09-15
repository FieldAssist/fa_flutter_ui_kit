import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/ir_company_config_provider.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/ir_configs.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/ir_sku.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/session_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';
import 'package:flutter/material.dart';

import '../../../core/file_repository/file_repository.dart';
import '../../../core/network_info.dart';
import '../../../data/remote/api_helper.dart';
import '../../common/app_texts.dart';
import '../data/dao/ir_dao.dart';
import '../data/ir_master_data_repository/IrMasterDataRepoImpl.dart';
import '../data/ir_master_data_repository/ir_master_data_repo.dart';
import '../data/ir_repository/ir_repository.dart';
import '../data/ir_repository/ir_repository_impl.dart';
import '../enum/image_upload_state_enum.dart';
import '../enum/kpi_enum.dart';
import '../models/ir_assets_model.dart';
import '../models/ir_master_model.dart';
import '../models/ir_master_model/ir_api_master_model.dart';
import '../models/ir_outlet_asset_details_model.dart';
import '../models/task_status.dart';
import '../services/image_recognition_service.dart';

class IrBloc {
  IrBloc({
    required this.networkInfo,
    required this.apiHelper,
    required this.irDb,
    required this.fileRepository,
    required this.irConfigs,
    required this.locator,
  }) {
    _irMasterDataRepository =
        IrMasterDataRepositoryImpl(apiHelper: apiHelper, irDb: irDb);
    irRepository = IrRepositoryImpl(apiHelper: apiHelper, irDao: irDb);
    _imageRecognitionService = ImageRecognitionService(
      apiHelper: apiHelper,
      irRepository: irRepository,
      fileRepository: fileRepository,
    );
  }

  final NetworkInfo networkInfo;
  final ApiHelper apiHelper;
  final IrDao irDb;
  final FileRepository fileRepository;
  final IrConfigs irConfigs;
  final GetIt locator;

  late IrRepository irRepository;

  late ImageRecognitionService _imageRecognitionService;

  late IrMasterDataRepository _irMasterDataRepository;

  IrMasterDataRepository get irMasterDataRepository => _irMasterDataRepository;

  ImageRecognitionService get imageRecognitionService =>
      _imageRecognitionService;

  final selectedAssetResponse =
      BehaviorSubject<List<IrMasterModel>?>.seeded(null);

  final assetsListOfInputCategories =
      BehaviorSubject<List<IrAssetsModel>?>.seeded(null);

  final equipmentListOfInputCategories =
      BehaviorSubject<List<IrOutletAssetDetailsModel>?>.seeded(null);

  final _assetsList = BehaviorSubject<List<IrAssetsModel>?>.seeded(null);

  BehaviorSubject<List<IrAssetsModel>?> get assetsList => _assetsList;

  List<IrApiMasterModel> _irEnabledMasterDataList = [];

  List<IrApiMasterModel> get irEnabledMasterDataList =>
      _irEnabledMasterDataList;

  set irEnabledMasterDataList(List<IrApiMasterModel> value) {
    _irEnabledMasterDataList = value;
  }

  bool get isIrOutlet =>
      (irEnabledMasterDataList.firstWhereOrNull(
        (element) => element.outlets
            .contains(irConfigs.sessionRepositoryIR.selectedOutletId),
      )) !=
      null;

  IrApiMasterModel? get irMasterModel =>
      irEnabledMasterDataList.isNotEmpty ? irEnabledMasterDataList.first : null;

  ValueNotifier<bool> noInternetUploader = ValueNotifier<bool>(false);
  ValueNotifier<bool> canSkipIrModule = ValueNotifier<bool>(false);

  final irAssetsList = <IrAssetsModel>[];

  Future<void> prepareAssetsList() async {
    _assetsList.add(null);

    await Future.delayed(
      Duration(seconds: 2),
    );

    irAssetsList.clear();

    //for ids
    final assetMasterList = (await _irMasterDataRepository.getIrMasterList())
        .where(
          (element) => element.outlets
              .contains(irConfigs.sessionRepositoryIR.selectedOutletId),
        )
        .toList();

    //for asset names and other details
    final assetDetailsList = await _irMasterDataRepository.getIrAssetDetails();

    await _irMasterDataRepository.saveIrOutletAssetDetails(
        irConfigs.sessionRepositoryIR.selectedOutletId);

    final irOutletAssetDetails =
        await _irMasterDataRepository.getIrOutletAssetDetails(
            irConfigs.sessionRepositoryIR.selectedOutletId);

    final uniqueAssetIdsWithBeforeStateEnabledData = <int, bool>{};

    for (final rule in assetMasterList) {
      for (final assetId in rule.assetList) {
        uniqueAssetIdsWithBeforeStateEnabledData.putIfAbsent(
          assetId,
          () => rule.beforeStateEnabled,
        );
      }
    }

    for (final assetId in uniqueAssetIdsWithBeforeStateEnabledData.entries) {
      //get asset name & other details.
      var asset = assetDetailsList
          .firstWhereOrNull((element) => element.id == assetId.key);

      if (asset == null) {
        continue;
      } else {
        asset = asset.copyWith(beforeAfterStateEnabled: assetId.value);
      }
      // if company uses asset management then check for equipments and it is not outlet asset
      if (irConfigs.companyConfigProvider.usesAssetManagement &&
          !asset.isOutletAsset) {
        //!IsOutletAsset
        final mappedEquipment = <IrOutletAssetDetailsModel>[];
        for (final equipment in irOutletAssetDetails) {
          if (equipment.assetDefinitionsId == asset.id) {
            final updatedEquipment = equipment.copyWith(
              beforeAfterStateEnabled: asset.beforeAfterStateEnabled ?? false,
            );
            mappedEquipment.add(updatedEquipment);

            //update it in master db so in case it is accessed from master we get updated record
            await _irMasterDataRepository.updateIrOutletAssetDetails(
              updatedEquipment,
            );
          }
        }
        irOutletAssetDetails
            .where(
              (element) => element.assetDefinitionsId == asset!.id,
            )
            .toList();

        if (mappedEquipment.isNotEmpty) {
          //if equipments found then update
          asset = asset.copyWith(mappedEquipments: mappedEquipment);
        } else {
          continue;
        }
      }
      irAssetsList.add(asset);
    }

    _assetsList.add(irAssetsList);
  }

  Future<void> updateAssetsListData(String? imageId) async {
    if (imageId != null) {
      _assetsList.add(null);
      await Future.delayed(
        Duration(
          milliseconds: 2500,
        ),
      );

      _assetsList.add(irAssetsList);
    }
  }

  Future<bool> checkIfAnyFailedImageAvailable() async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final response = allResponses.firstWhereOrNull(
      (element) => element.irResponseModel == null,
    );

    if (response != null) {
      return false;
    }

    return true;
  }

  Future<void> updateResponseOfSelectedAsset(
    int assetId,
    IrImageUploadStateEnum imageUploadState,
  ) async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final assetResponse = allResponses
        .where(
          (element) =>
              element.assetId == assetId &&
              element.outletId ==
                  irConfigs.sessionRepositoryIR.selectedOutletId &&
              element.beatId == irConfigs.sessionRepositoryIR.selectedBeatId &&
              element.imageUploadState == imageUploadState,
        )
        .toList();
    if (checkIfListIsNotEmpty(assetResponse)) {
      selectedAssetResponse
        ..addDataSafely(null)
        ..addDataSafely(assetResponse);
    }
  }

  Future<void> prepareListOfInputDataCategories() async {
    assetsListOfInputCategories.add(null);
    equipmentListOfInputCategories.add(null);

    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final groupMap = <int, List<IrMasterModel>>{};
    for (final response in allResponses) {
      if (response.equipmentId != null) {
        if (groupMap.containsKey(response.equipmentId!)) {
          groupMap[response.equipmentId!]!.add(response);
        } else {
          groupMap.putIfAbsent(response.equipmentId!, () => [response]);
        }
      } else {
        if (groupMap.containsKey(response.assetId)) {
          groupMap[response.assetId]!.add(response);
        } else {
          groupMap.putIfAbsent(response.assetId, () => [response]);
        }
      }
    }

    final assetIds = groupMap.keys.toList();

    final assetResponse = irAssetsList
        .where(
          (element) => assetIds.contains(element.id),
        )
        .toList();

    final allEquipments = await _irMasterDataRepository!
        .getIrOutletAssetDetails(
            irConfigs.sessionRepositoryIR.selectedOutletId);

    final equipments = allEquipments
        .where((element) => assetIds.contains(element.equipmentId))
        .toList();

    assetsListOfInputCategories.add(assetResponse);
    equipmentListOfInputCategories.add(equipments);
  }

  Future<bool> showFailedImagePopUp() async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final response = allResponses.firstWhereOrNull(
      (element) =>
          element.syncStatus == TaskStatus.fail &&
          element.irResponseModel == null,
    );

    if (response != null) {
      return true;
    }

    return false;
  }

  Future<bool> routeToOrderBooking() async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final response = allResponses.firstWhereOrNull(
      (element) => element.internetAvailable,
    );

    if (response != null) {
      return false;
    }

    return true;
  }

  Future<bool> checkForImagesInProgress(BuildContext context) async {
    late BuildContext dialogContext;
    unawaited(
      showDialog(
        useSafeArea: true,
        barrierDismissible: false,
        context: context,
        builder: (cxt) {
          dialogContext = cxt;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Lottie.asset(
                      'assets/animations/ir_detection_on_progress.json',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    AppTexts().kIRISWorking,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    var shouldWait = true;

    final timer = Timer(
      Duration(
        minutes: 5,
      ),
      () => shouldWait = false,
    );

    while (shouldWait) {
      await Future.delayed(
        Duration(
          seconds: 2,
        ),
      );
      final allResponses = await irRepository
          .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

      final response = allResponses.firstWhereOrNull(
        (element) =>
            element.internetAvailable &&
            element.syncStatus == TaskStatus.pending,
      );

      if (response == null) {
        timer.cancel();
        shouldWait = false;
        break;
      }
    }

    Navigator.of(dialogContext).pop();

    return false;
  }

  Future<bool> showEmptyAssetsPopUp() async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final groupMap = allResponses.groupBy((element) => element.assetId);

    final assetIds = groupMap.keys.toList();

    if (assetIds.length != irAssetsList.length) {
      return true;
    }

    return false;
  }

  Future<bool> checkForNoInternetAnsUnSyncedImages() async {
    final isConnected = await networkInfo.isConnected;

    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final response = allResponses.firstWhereOrNull(
      (element) =>
          element.syncStatus == TaskStatus.pending &&
          !element.internetAvailable,
    );

    if (isConnected && response != null) {
      noInternetUploader.value = true;
      return true;
    }

    noInternetUploader.value = false;
    return false;
  }

  Future<void> startProcessImageFlow(IrMasterModel visit) async {
    final isConnected = await networkInfo.isConnected;
    //Todo: (Ritsz123): find some other way to get guid.
    final _attendanceId = "TEST";
        // locator<EventBloc>().getCurrentEvent().callData?.guid ?? "";

    final _updatedVisit = visit.copyWith(
      isForPlanogram: getIdealPlanogramImageUrl(visit.assetId) != null,
      irRequestModel: visit.irRequestModel?.copyWith(
        attendanceId: _attendanceId,
        beforeSeenEnabled: (irMasterModel?.beforeStateEnabled ?? false) ? 1 : 0,

        /// Just to ensure
        imageState: (irMasterModel?.beforeStateEnabled ?? false)
            ? visit.irRequestModel?.imageState ?? 100
            : 100,
      ),
    );

    await irRepository.saveAResponse(_updatedVisit);
    canSkipIrModule.value = false;

    if (isConnected) {
      await _imageRecognitionService.processImageRecognitionV2(
        _updatedVisit.copyWith(
          internetAvailable: true,
        ),
      );
    }
  }

  Future<void> uploadUnSyncedImagesOfUser() async {
    final allResponses = await irRepository.getAllResponsesOfIr();

    final response = allResponses
        .where(
          (element) =>
              element.syncStatus == TaskStatus.pending &&
              !element.internetAvailable,
        )
        .toList();

    for (final img in response) {
      unawaited(startProcessImageFlow(img));
    }
  }

  Future<void> uploadUnSyncedImages() async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final response = allResponses
        .where(
          (element) =>
              element.syncStatus == TaskStatus.pending &&
              !element.internetAvailable,
        )
        .toList();

    for (final img in response) {
      unawaited(startProcessImageFlow(img));
    }
  }

  Future<List<Pair<IrSku, int>>> getAllIdentifiedSkuWithCount() async {
    final allIrResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final allIdentifiedSkuWithCount = <Pair<IrSku, int>>[];

    for (final res in allIrResponses) {
      if (res.irResponseModel == null) {
        continue;
      }
      for (final productResponse in res.irResponseModel!.products) {
        final sku =
            irConfigs.skuRepositoryIR.idVsSkus[int.parse(productResponse.id)];
        if (sku == null) {
          continue;
        }
        final pair = Pair(sku, productResponse.count);
        allIdentifiedSkuWithCount.add(pair);
      }
    }
    return allIdentifiedSkuWithCount;
  }

  Future<void> updateResponseOfSelectedEquipment(
    int equipmentId,
    IrImageUploadStateEnum imageUploadState,
  ) async {
    final allResponses = await irRepository
        .getAllResponses(irConfigs.sessionRepositoryIR.selectedOutletId);

    final assetResponse = allResponses.firstWhereOrNull(
      (element) =>
          element.equipmentId == equipmentId &&
          element.outletId == irConfigs.sessionRepositoryIR.selectedOutletId &&
          element.beatId == irConfigs.sessionRepositoryIR.selectedBeatId &&
          element.imageUploadState == imageUploadState,
    );

    if (assetResponse != null) {
      selectedAssetResponse
        ..addDataSafely(null)
        ..addDataSafely([assetResponse]);
    }
  }

  bool getBeforeAfterEnabled(int assetId) {
    final asset =
        irAssetsList.firstWhereOrNull((element) => element.id == assetId);
    return asset?.beforeAfterStateEnabled ?? false;
  }

  String? getIdealPlanogramImageUrl(int? assetId) {
    if (assetId == null) {
      return null;
    }

    final _irMaster = irEnabledMasterDataList
        .firstWhereOrNull((element) => element.assetList.contains(assetId));
    if (_irMaster == null) {
      return null;
    }

    final _kpiWeightage = _irMaster.kpiWeightageList?.firstWhereOrNull(
      (element) => element.kpiEnum == IrKpiEnum.planogramCompliance,
    );

    return _kpiWeightage?.planogram
        ?.firstOrNullWhere(
          (element) => element.assetDefinitionIds?.contains(assetId) ?? false,
        )
        ?.idealPlanogramImageUrl;
  }

  void checkIfCanSkipIrModule(
    List<IrMasterModel> data,
  ) =>
      canSkipIrModule.value = !data.any(
        (element) =>
            element.outletId ==
                irConfigs.sessionRepositoryIR.selectedOutletId &&
            element.beatId == irConfigs.sessionRepositoryIR.selectedBeatId,
      );

  @override
  void dispose() {
    selectedAssetResponse.close();
    _assetsList.close();
  }
}
