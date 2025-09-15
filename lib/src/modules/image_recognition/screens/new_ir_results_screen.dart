import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/ir_sku.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/screens/widgets/ir_result_card_new.dart';
import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import '../../common/app_texts.dart';
import '../bloc/ir_bloc.dart';
import '../enum/image_upload_state_enum.dart';
import '../models/ir_assets_model.dart';
import '../models/ir_master_model.dart';
import '../models/ir_outlet_asset_details_model.dart';
import '../models/task_status.dart';

class NewIrResultsScreen extends StatefulWidget {
  const NewIrResultsScreen({
    required this.onProceed,
    // required this.assetId,
    required this.listOfAssets,
    required this.listOfEquipments,
    required this.irBloc,
    super.key,
  });

  final VoidCallback onProceed;

  // final int assetId;
  final List<IrAssetsModel> listOfAssets;
  final List<IrOutletAssetDetailsModel> listOfEquipments;
  final IrBloc irBloc;

  @override
  State<NewIrResultsScreen> createState() => _CustomIrResultsPageState();
}

class _CustomIrResultsPageState extends State<NewIrResultsScreen> {
  int _currentIndex = 0;
  int _assetIndex = 0;

  double _dragPosition = 0.1;

  @override
  void initState() {
    super.initState();
    if (widget.listOfAssets.isNotEmpty) {
      widget.irBloc.updateResponseOfSelectedAsset(
        widget.listOfAssets.first.id,
        widget.listOfAssets.first.beforeAfterStateEnabled ?? false
            ? IrImageUploadStateEnum.after
            : IrImageUploadStateEnum.singleImage,
      );
    } else {
      widget.irBloc.updateResponseOfSelectedEquipment(
        widget.listOfEquipments.first.equipmentId,
        widget.listOfEquipments.first.beforeAfterStateEnabled
            ? IrImageUploadStateEnum.after
            : IrImageUploadStateEnum.singleImage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<List<IrMasterModel>?>(
          stream: widget.irBloc.selectedAssetResponse.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error?.toString() ?? ""),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              final irMasterModel = snapshot.data!;

              final irModelPresent =
                  irMasterModel[_assetIndex].irResponseModel != null;

              if (irMasterModel[_assetIndex].irResponseModel == null) {
                if (irMasterModel[_assetIndex].syncStatus == TaskStatus.fail) {
                  return _syncFailUi(irMasterModel[_assetIndex]);
                } else if (irMasterModel[_assetIndex].syncStatus ==
                        TaskStatus.pending &&
                    !irMasterModel[_assetIndex].internetAvailable) {
                  return _syncPendingUi();
                }
              }

              if (irModelPresent) {
                return IrResultCardNew(
                  irBloc: widget.irBloc,
                  irMasterModel: irMasterModel[_assetIndex],
                  irResultsNavBar: IrResultsNavBar(
                    assetIndex: _assetIndex,
                    prevNextEnabled: irMasterModel.length > 1,
                    onBeforePressed: () {
                      if (_currentIndex < widget.listOfAssets.length) {
                        widget.irBloc.updateResponseOfSelectedAsset(
                          widget.listOfAssets[_currentIndex].id,
                          IrImageUploadStateEnum.before,
                        );
                      } else {
                        widget.irBloc.updateResponseOfSelectedEquipment(
                          widget
                              .listOfEquipments[
                                  _currentIndex - widget.listOfAssets.length]
                              .equipmentId,
                          IrImageUploadStateEnum.before,
                        );
                      }
                    },
                    onAfterPressed: () {
                      if (_currentIndex < widget.listOfAssets.length) {
                        widget.irBloc.updateResponseOfSelectedAsset(
                          widget.listOfAssets[_currentIndex].id,
                          IrImageUploadStateEnum.after,
                        );
                      } else {
                        widget.irBloc.updateResponseOfSelectedEquipment(
                          widget
                              .listOfEquipments[
                                  _currentIndex - widget.listOfAssets.length]
                              .equipmentId,
                          IrImageUploadStateEnum.after,
                        );
                      }
                    },
                    onNextPressed: () {
                      if (_assetIndex == irMasterModel.length) {
                        return;
                      }
                      _assetIndex++;
                      if (_assetIndex < irMasterModel.length) {
                        widget.irBloc.updateResponseOfSelectedAsset(
                          irMasterModel[_assetIndex].assetId,
                          irMasterModel[_assetIndex].imageUploadState,
                        );
                      }
                    },
                    onPrevPressed: () {
                      if (_assetIndex == 0) {
                        return;
                      }
                      _assetIndex--;
                      if (_assetIndex < irMasterModel.length) {
                        widget.irBloc.updateResponseOfSelectedAsset(
                          irMasterModel[_assetIndex].assetId,
                          irMasterModel[_assetIndex].imageUploadState,
                        );
                      }
                    },
                    currentIndex: _currentIndex,
                    maxIndex: irMasterModel.length - 1,
                    beforeAfterEnabled: widget.irBloc.getBeforeAfterEnabled(
                      _currentIndex < widget.listOfAssets.length
                          ? widget.listOfAssets[_currentIndex].id
                          : widget
                              .listOfEquipments[
                                  _currentIndex - widget.listOfAssets.length]
                              .assetDefinitionsId,
                    ),
                  ),
                  onTapCategoryButton: (categoryIndex, dragPosition) {
                    _assetIndex = 0;
                    _dragPosition = dragPosition;
                    _currentIndex = categoryIndex;
                    if (_currentIndex < widget.listOfAssets.length) {
                      widget.irBloc.updateResponseOfSelectedAsset(
                        widget.listOfAssets[_currentIndex].id,
                        widget.listOfAssets[_currentIndex]
                                    .beforeAfterStateEnabled ??
                                false
                            ? IrImageUploadStateEnum.after
                            : IrImageUploadStateEnum.singleImage,
                      );
                    } else {
                      widget.irBloc.updateResponseOfSelectedEquipment(
                        widget
                            .listOfEquipments[
                                _currentIndex - widget.listOfAssets.length]
                            .equipmentId,
                        widget
                                .listOfEquipments[
                                    _currentIndex - widget.listOfAssets.length]
                                .beforeAfterStateEnabled
                            ? IrImageUploadStateEnum.after
                            : IrImageUploadStateEnum.singleImage,
                      );
                    }
                  },
                  listOfAssets: widget.listOfAssets,
                  listOfEquipments: widget.listOfEquipments,
                  onProceed: () async {
                    final allIdentifiedSkusIds =
                        (await widget.irBloc.getAllIdentifiedSkuWithCount())
                            .map((e) => e.first.id)
                            .toList()
                            .toSet();

                    final allMustSellSkuIds = widget
                        .irBloc.irConfigs.skuRepositoryIR.mustSellSkus
                        .toSet();

                    for (final skuId in allIdentifiedSkusIds) {
                      if (allMustSellSkuIds.contains(skuId)) {
                        allMustSellSkuIds.remove(skuId);
                      }
                    }

                    final isAllMustSellIdentifiedByIr =
                        allMustSellSkuIds.isEmpty;

                    if (!isAllMustSellIdentifiedByIr) {
                      final missedMustSellSkus = widget
                          .irBloc.irConfigs.skuRepositoryIR.idVsSkus.values
                          .where((sku) => allMustSellSkuIds.contains(sku.id))
                          .toList();

                      final res = await _showMissedMustSellDialog(
                        context,
                        missedMustSellSkus,
                      );

                      if (res == null) {
                        return;
                      } else if (res == false) {
                        Navigator.of(context).pop();
                        return;
                      }
                    }

                    widget.onProceed();
                  },
                  dragPosition: _dragPosition,
                );
              }
              // else if (internetAvailable == null) {
              //   return Center(
              //     child: Text(
              //       AppTexts().kIrSyncData,
              //     ),
              //   );
              // }
              else {
                return Center(
                  child: Text(AppTexts().kRetakePicture),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _showMissedMustSellDialog(
    BuildContext context,
    List<IrSku> missedMustSellSkus,
  ) async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title and close button
                Text(
                  "You've missed a couple of Must Sell SKUs!",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Scrollable list of SKUs with bullet points
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: missedMustSellSkus.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 12)),
                            Expanded(
                              child: Text(
                                missedMustSellSkus[index].name,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Proceed Anyway button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        'Proceed Anyway',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Re-Capture button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(
                        'Re-Capture',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _syncFailUi(IrMasterModel irMasterModel) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .055,
        ),
        child: GestureDetector(
          onTap: () {
            // _retakeImage
            Navigator.of(context).pop();
          },
          child: Container(
            // color: AppColors.kKeepGreen,
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppTexts().kRetakePhoto,
                    style: TextStyle(
                      color: AppColors.kDarkBlue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    irMasterModel.uploadImageFailedReason,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _syncPendingUi() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .055,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            // color: AppColors.kKeepGreen,
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppTexts().kIrSyncData,
                    style: TextStyle(
                      color: AppColors.kDarkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
