import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

// import 'package:fa_flo/core/log/index.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/session_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';
import '../../../utils/log_utils.dart';
import '../enum/image_upload_state_enum.dart';
import '../models/ir_assets_model.dart';
import '../models/ir_master_model.dart';
import '../models/ir_outlet_asset_details_model.dart';
import '../models/ir_request_model.dart';
import '../models/task_status.dart';
import 'ir_bloc.dart';

class ComparisonCardBloc {
  ComparisonCardBloc({
    required this.equipmentModel,
    required this.assetModel,
    required this.skuRepository,
    required this.irBloc,
    required this.sessionRepository,
  });

  final IrOutletAssetDetailsModel? equipmentModel;
  final IrAssetsModel? assetModel;
  final SkuRepositoryIR skuRepository;
  final SessionRepositoryIR sessionRepository;
  final IrBloc irBloc;
  final String uniqueCardId = Uuid().v1();

  String? beforeImagePath;
  String? afterImagePath;

  final _compliancesSubject =
      BehaviorSubject<Map<IrImageUploadStateEnum, List<String>>?>.seeded(null);

  Stream<Map<IrImageUploadStateEnum, List<String>>?> get compliances =>
      _compliancesSubject.stream;

  Timer? _timer;

  final irList = BehaviorSubject<List<IrMasterModel>?>.seeded(null);

  void submitImage({
    required IrImageUploadStateEnum uploadState,
    required File file,
  }) {
    if (uploadState == IrImageUploadStateEnum.after) {
      afterImagePath = file.path;
      uploadImageFlow(index: 1, file: file, imageUploadState: uploadState);
    } else {
      beforeImagePath = file.path;
      uploadImageFlow(
        index: 0,
        file: file,
        imageUploadState: uploadState,
      );
    }

    prepareIRList();
    resetCompliances();
  }

  Future<void> uploadImageFlow({
    required int index,
    required File file,
    required IrImageUploadStateEnum imageUploadState,
  }) async {
    final getVisitModel = createVisitData(file, index, imageUploadState);
    await irBloc.startProcessImageFlow(
      getVisitModel,
    );
  }

  IrMasterModel createVisitData(
    File file,
    int index,
    IrImageUploadStateEnum imageUploadState,
  ) {
    final uniqueId = (equipmentModel != null
            ? equipmentModel!.assetDefinitionsId.toString() +
                equipmentModel!.equipmentId.toString()
            : assetModel!.id.toString()) +
        sessionRepository.selectedBeatId.toString() +
        sessionRepository.selectedOutletId.toString() +
        index.toString() +
        (assetModel?.instanceNumber ?? 1).toString();

    // final imageId = getImageId(index);

    final irModel = IrMasterModel(
      uniqueId: uniqueId,
      imageUploadState: imageUploadState,
      instanceNumber: assetModel != null ? assetModel!.instanceNumber : 1,
      beatId: sessionRepository.selectedBeatId,
      outletId: sessionRepository.selectedOutletId,
      localFilePath: file.path,
      syncStatus: TaskStatus.pending,
      imageIndex: index,
      assetId: equipmentModel != null
          ? equipmentModel!.assetDefinitionsId
          : assetModel!.id,
      equipmentId: equipmentModel?.equipmentId,
      assetName: equipmentModel != null
          ? equipmentModel!.assetName ?? ''
          : assetModel!.name,
      internetAvailable: false,
      irRequestModel: IrRequestModel(
        sessionId: sessionRepository.sessionId ?? "",
        assetId: equipmentModel != null
            ? equipmentModel!.assetDefinitionsId
            : assetModel!.id,
        equipmentId: equipmentModel?.equipmentId,
        // imageId: imageId,
        focusedProducts: skuRepository.focusProducts,
        mustSellProducts: skuRepository.mustSellSkus,
        outletId: sessionRepository.selectedOutletId,
        imageState: imageUploadState == IrImageUploadStateEnum.singleImage
            ? 100
            : index,
        remarks: "",
        logicId: irBloc.irMasterModel?.id ?? 0,
        premiumSkus: skuRepository.premiumSkus.toList(),
      ),
    );

    return irModel;
  }

  String getImageId(int index) {
    // Backend required image-id to be of length 32
    // that's why we are creating this logic[
    var imageId = equipmentModel != null
        ? "${equipmentModel!.assetDefinitionsId}${equipmentModel!.equipmentId}${sessionRepository.selectedOutletId}"
        : "${assetModel!.id}${sessionRepository.selectedOutletId}${assetModel!.instanceNumber}";

    imageId = imageId.padRight(32, "0");

    if (index <= 9) {
      imageId = imageId.substring(0, 31) + index.toString();
    } else if (index >= 10 && index <= 99) {
      imageId = imageId.substring(0, 30) + index.toString();
    }

    return imageId;
  }

  Future<List<IrMasterModel>> listOfAssetResponses() async {
    final list = irBloc.irRepository.getSpecificAssetResponses(
      outletId: sessionRepository.selectedOutletId,
      beatId: sessionRepository.selectedBeatId,
      routeId: 0,
      assetId: equipmentModel != null
          ? equipmentModel!.assetDefinitionsId
          : assetModel!.id,
      equipmentId: equipmentModel?.equipmentId,
      instanceNumber: assetModel?.instanceNumber ?? 1,
    );

    return list;
  }

  Future<void> updateAlreadyCapturedImages() async {
    final irMasterList = await listOfAssetResponses();
    if (irMasterList.length > 2) {
      logger.w("More than 2 images are captured");
    } else {
      if (irMasterList.isNotEmpty) {
        beforeImagePath = irMasterList[0].localFilePath;
        if (irMasterList.length > 1) {
          afterImagePath = irMasterList[1].localFilePath;
        }
      }
    }
  }

  void prepareIRList() {
    irList.add(null);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      if (timer.tick == 0) {
        return;
      }
      final list = await listOfAssetResponses();

      irList.addDataSafely(list);
      if (list.isNotEmpty &&
          !list.any((item) => item.syncStatus != TaskStatus.completed)) {
        timer.cancel();
      }
    });
  }

  Future<void> checkKpiComplianceForAsset({
    required IrImageUploadStateEnum imageUploadState,
  }) async {
    final _compliances = <IrImageUploadStateEnum, List<String>>{};

    _compliancesSubject.addDataSafely(null);

    final assetId = equipmentModel != null
        ? equipmentModel!.assetDefinitionsId
        : assetModel!.id;

    final allResponses = await irBloc.irRepository
        .getAllResponses(sessionRepository.selectedOutletId);

    final currentAssetResponse = allResponses.firstWhereOrNull(
      (element) =>
          element.instanceNumber ==
              (assetModel != null ? assetModel!.instanceNumber : 1) &&
          element.assetId == assetId &&
          element.outletId == sessionRepository.selectedOutletId &&
          element.beatId == sessionRepository.selectedBeatId &&
          element.imageUploadState == imageUploadState,
    );

    final missingCompliances = <String>[];
    if (currentAssetResponse != null &&
        currentAssetResponse.irResponseModel != null) {
      final assetMasterWithMappedCurrentAsset =
          (await irBloc.irMasterDataRepository.getIrMasterList())
              .where((element) => element.assetList.contains(assetId))
              .toList();
      for (final assetMaster in assetMasterWithMappedCurrentAsset) {
        if (assetMaster.kpiWeightageList == null ||
            assetMaster.kpiWeightageList!.isEmpty) {
          continue;
        }
        for (final definedKpi in assetMaster.kpiWeightageList!) {
          final matchingKpi = currentAssetResponse.irResponseModel!.kpiWeightage
              .firstWhereOrNull((element) =>
                  element.kpiEnum != null &&
                  element.kpiEnum == definedKpi.kpiEnum);
          if (matchingKpi != null) {
            if ((matchingKpi.result ?? 0) < (definedKpi.target ?? 0)) {
              missingCompliances.add(
                  "${definedKpi.kpiEnum!.title} < ${definedKpi.target?.toStringAsFixed(2)}%");
            }
          }
        }
        assetMaster.kpiWeightageList;
      }

      if (_compliances.containsKey(imageUploadState)) {
        _compliances.remove(imageUploadState);
      }

      _compliances.putIfAbsent(imageUploadState, () => missingCompliances);
      _compliancesSubject.addDataSafely(_compliances);
    }
  }

  void resetCompliances() {
    _compliancesSubject.addDataSafely(null);
  }

  @override
  void dispose() {
    _compliancesSubject.close();
    _timer?.cancel();
    _timer = null;
    irList.close();
  }
}
