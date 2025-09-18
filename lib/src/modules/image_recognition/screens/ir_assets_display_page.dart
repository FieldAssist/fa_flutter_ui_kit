import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import '../../../../fa_flutter_ui_kit.dart';
import '../../../config/colors.dart';
import '../../../utils/log_utils.dart';
import '../../common/app_texts.dart';
import '../bloc/ir_bloc.dart';
import '../configs/app_theme_config.dart';
import '../enum/image_upload_state_enum.dart';
import 'ir_results_page.dart';
import 'widgets/ir_asset_card.dart';
import '../models/ir_assets_model.dart';
import '../models/ir_outlet_asset_details_model.dart';

class IrAssetsDisplayPage extends StatefulWidget {
  const IrAssetsDisplayPage({
    required this.onProceed,
    required this.onProceedResultsPage,
    required this.navigatorKey,
    required this.irBloc,
    this.reviewFlow = false,
    super.key,
  });

  final void Function() onProceed;
  final void Function() onProceedResultsPage;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool reviewFlow;
  final IrBloc irBloc;

  @override
  State<IrAssetsDisplayPage> createState() => _IrAssetsDisplayPageState();
}

class _IrAssetsDisplayPageState extends State<IrAssetsDisplayPage>
    with WidgetsBindingObserver {
  late Timer timer;

  bool showReSyncButton = false;

  List<IrAssetCard> selectedAssets = [];
  final assetIdsOfRenderedCard = <int, int>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.irBloc.prepareAssetsList().then((value) => init());

    reSyncButton();
  }

  Future<void> reSyncButton() async {
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (timer.tick == 0) {
        return;
      }
      showReSyncButton =
          await widget.irBloc.checkForNoInternetAnsUnSyncedImages();
    });
  }

  Future<void> autoRouteToResultsScreen() async {
    final autoRoute = await widget.irBloc.checkIfAnyFailedImageAvailable();

    if (autoRoute) {
      widget.onProceedResultsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.reviewFlow,
      onPopInvoked: (canPop) async {
        if (canPop) {
          return;
        }
        final shouldPop = await showExitConfirmDialog();
        if (shouldPop && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          title: Text(
              '${widget.irBloc.irConfigs.isUserJsr ? AppTexts().kSKUAvailability : AppTexts().kImageRecognition}'),
          actions: [
            if (isDebug)
              IconButton(
                onPressed: () async {
                  final cancel = BotToast.showLoading();
                  await widget.irBloc.irRepository.clearIrResponses(
                    outletId: widget
                        .irBloc.irConfigs.sessionRepositoryIR.selectedOutletId,
                  );
                  cancel();
                  BotToast.showText(text: 'Cleared IR db');
                  selectedAssets.clear();
                  assetIdsOfRenderedCard.clear();
                  setState(() {});
                },
                icon: Icon(Icons.refresh),
              ),
            if (!widget.irBloc.irMasterModel!.isMandatory)
              ValueListenableBuilder(
                valueListenable: widget.irBloc.canSkipIrModule,
                builder: (context, res, _) {
                  if (!res) {
                    return SizedBox.shrink();
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      border: Border.all(
                        color: AppColors.kEditFieldBlueBorder,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: widget.onProceed,
                      child: Text('${AppTexts().kSkip}'),
                    ),
                  );
                },
              ),
            ValueListenableBuilder<bool>(
              valueListenable: widget.irBloc.noInternetUploader,
              builder: (context, value, _) {
                if (!value) {
                  return SizedBox();
                }
                return IconButton(
                  tooltip: AppTexts().kIrSyncData,
                  onPressed: widget.irBloc.uploadUnSyncedImages,
                  icon: Icon(
                    Icons.cloud_upload_rounded,
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Container(
            //   color: AppColors.kWhite,
            //   child: OrderTimeLineWidget(
            //     currentOrderTimeLine: widget.isJsrUser
            //         ? OrderTimeLine.skuAvailability
            //         : OrderTimeLine.ir,
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<List<IrAssetsModel>?>(
                stream: widget.irBloc.assetsList,
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.hasData) {
                    final listOfAssets = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            "Hi ${widget.irBloc.irConfigs.userRepositoryIr.userName}, select any asset to add image",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            spacing: 10,
                            runSpacing: 10,
                            children: _generateChildren(listOfAssets),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: ListView.builder(
                              key: ValueKey(selectedAssets.length),
                              itemCount: selectedAssets.length,
                              itemBuilder: (context, index) {
                                return selectedAssets[index];
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/animations/ir_loader.json',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(height: 16),
                            Text(
                                '${widget.irBloc.irConfigs.isUserJsr ? AppTexts().kSKUAvailability : AppTexts().kImageRecognition} ${AppTexts().kIrLoading}'),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: StreamBuilder<List<IrAssetsModel>?>(
          stream: widget.irBloc.assetsList,
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.hasData) {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .05,
                    12,
                    MediaQuery.of(context).size.width * .05,
                    12),
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient: widget
                      .irBloc.irConfigs.appThemeConfigProvider.appThemeGradient,
                  color: widget.irBloc.irConfigs.appThemeConfigProvider
                      .appThemePrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await CommonProgressDialog.show(
                      context,
                      message: AppTexts().kPleaseWait,
                    );

                    final imagesTakenForAllEquipments =
                        await widget.irBloc.isImagesTakenForAllEquipments();

                    final shouldRouteDirectlyToOrderBooking =
                        await widget.irBloc.routeToOrderBooking();

                    await CommonProgressDialog.hide();

                    if (!imagesTakenForAllEquipments) {
                      BotToast.showText(
                        text: AppTexts().kIrNotPerformedOnEquipmentsMsg,
                      );
                      return;
                    }

                    if (shouldRouteDirectlyToOrderBooking) {
                      final val = await showDialog(
                        context: context,
                        builder: (dialogContext) => dialogWidget(
                          subtitle:
                              "${AppTexts().kIrOrderStockWarning.replaceFirst("%s", widget.irBloc.irConfigs.isUserJsr ? AppTexts().kStock : AppTexts().kOrder)}",
                          rightButtonFunction: () {
                            Navigator.pop(dialogContext, true);
                          },
                          leftButtonFunction: () {
                            Navigator.pop(dialogContext, false);
                          },
                        ),
                      );
                      if (val == null || val == false) {
                        return;
                      }
                      widget.onProceed();
                      return;
                    }

                    await widget.irBloc.checkForImagesInProgress(context);

                    await CommonProgressDialog.show(
                      context,
                      message: "Checking Images Data...",
                    );

                    final shouldShowFailedImageDialog =
                        await widget.irBloc.showFailedImagePopUp();
                    final shouldShowEmptyCategoriesDialog =
                        await widget.irBloc.showEmptyAssetsPopUp();
                    final checkUnSyncedImages = await widget.irBloc
                        .checkForNoInternetAnsUnSyncedImages();

                    await CommonProgressDialog.hide();

                    if (checkUnSyncedImages) {
                      final val = await showDialog(
                        context: context,
                        builder: (dialogContext) => dialogWidget(
                          subtitle:
                              "Some Images are not synced, please sync images and continue",
                          rightButtonText: 'SYNC DATA',
                          rightButtonFunction: () {
                            Navigator.pop(dialogContext, false);
                            widget.irBloc.uploadUnSyncedImages();
                          },
                          leftButtonFunction: () {
                            Navigator.pop(dialogContext, false);
                          },
                        ),
                      );
                      if (val == null || val == false) {
                        return;
                      }
                    }

                    if (shouldShowFailedImageDialog) {
                      final val = await showDialog(
                        context: context,
                        builder: (dialogContext) => dialogWidget(
                          subtitle:
                              "One or more category has failed the check, do you want to continue?",
                          rightButtonFunction: () {
                            Navigator.pop(dialogContext, true);
                          },
                          leftButtonFunction: () {
                            Navigator.pop(dialogContext, false);
                          },
                        ),
                      );
                      if (val == null || val == false) {
                        return;
                      }
                    }

                    if (shouldShowEmptyCategoriesDialog) {
                      final val = await showDialog(
                        context: context,
                        builder: (dialogContext) => dialogWidget(
                          subtitle:
                              "You haven’t taken image for some assets, do you want to continue?",
                          rightButtonFunction: () {
                            Navigator.pop(dialogContext, true);
                          },
                          leftButtonFunction: () {
                            Navigator.pop(dialogContext, false);
                          },
                        ),
                      );
                      if (val == null || val == false) {
                        return;
                      }
                    }

                    // widget.irBloc.locator<IrEventBloc>().addAppSpecificTask(
                    //   widget.irBloc.irConfigs.isUserJsr
                    //       ? AppSpecificTasks.skuAvailability
                    //       : AppSpecificTasks.ir,
                    // );
                    final id = await widget.navigatorKey.currentState?.push(
                      MaterialPageRoute(
                        builder: (_) => IrResultsPage(
                          onProceed: widget.onProceed,
                          irBloc: widget.irBloc,
                        ),
                      ),
                    );
                    if (id != null) {
                      unawaited(widget.irBloc.updateAssetsListData(id));
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTexts().kSeeResults,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Future<bool> showExitConfirmDialog() async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          content: Text(
            AppTexts().kExitIrConfirmationMsg,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                AppTexts().kYes,
                style: TextStyle(
                  color: widget.irBloc.irConfigs.appThemeConfigProvider
                      .appThemePrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                AppTexts().kNo,
                style: TextStyle(
                  color: widget.irBloc.irConfigs.appThemeConfigProvider
                      .appThemeSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
    return res ?? false;
  }

  Widget dialogWidget(
      {required String subtitle,
      Function? rightButtonFunction,
      Function? leftButtonFunction,
      String rightButtonText = 'CONTINUE'}) {
    return GenericDialog(
      title: 'Alert',
      subtitle: subtitle,
      rightButtonFunction: rightButtonFunction,
      rightActionText: rightButtonText,
      rightButtonBgColor:
          widget.irBloc.irConfigs.appThemeConfigProvider.appThemePrimaryColor,
      rightTextColor: Colors.white,
      leftButtonFunction: leftButtonFunction,
      leftActionText: 'CANCEL',
      buttonBgColor: AppColors.kWhite,
      buttonTextBgColor: Colors.red,
    );
  }

  Widget _buildAssetButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacityFactor(0.05),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              size: 18,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  List<Widget> _generateChildren(List<IrAssetsModel> listOfAssets) {
    final list = <Widget>[];
    for (final asset in listOfAssets) {
      if (asset.mappedEquipments != null &&
          asset.mappedEquipments!.isNotEmpty) {
        for (final equipment in asset.mappedEquipments!) {
          list.add(
            _buildAssetButton(
              label: equipment.equipmentName,
              onTap: () {
                //Allow only single instance of equipment
                if (!assetIdsOfRenderedCard
                    .containsKey(equipment.equipmentId)) {
                  assetIdsOfRenderedCard.putIfAbsent(
                      equipment.equipmentId, () => 1);
                  selectedAssets.add(
                    _getAssetCard(asset: asset, equipment: equipment),
                  );
                  setState(() {});
                }
              },
            ),
          );
        }
      } else {
        list.add(
          _buildAssetButton(
            label: asset.name,
            onTap: () {
              assetIdsOfRenderedCard.update(
                asset.id,
                (val) => val + 1,
                ifAbsent: () => 1,
              );
              selectedAssets.add(
                _getAssetCard(
                  asset: asset.copyWith(
                    instanceNumber: assetIdsOfRenderedCard[asset.id]!,
                  ),
                  equipment: null,
                ),
              );

              setState(() {});
            },
          ),
        );
      }
    }
    return list;
  }

  IrAssetCard _getAssetCard({
    required IrAssetsModel asset,
    required IrOutletAssetDetailsModel? equipment,
  }) {
    return IrAssetCard(
      irAssetModel: asset,
      equipment: equipment,
      allowBeforeAfterCapture: asset.beforeAfterStateEnabled ?? false,
      onDelete: (irAssetCard) =>
          _handleAssetDelete(asset, equipment, irAssetCard),
      irBloc: widget.irBloc,
    );
  }

  void _handleAssetDelete(
    IrAssetsModel asset,
    IrOutletAssetDetailsModel? equipment,
    IrAssetCard irAssetCard,
  ) {
    selectedAssets.remove(irAssetCard);
    if (equipment != null) {
      assetIdsOfRenderedCard.remove(equipment.equipmentId);
    } else {
      final currentCount = assetIdsOfRenderedCard[asset.id] ?? 0;
      if (currentCount <= 1) {
        assetIdsOfRenderedCard.remove(asset.id);
      } else {
        assetIdsOfRenderedCard[asset.id] = currentCount - 1;
      }
    }
    setState(() {});
    logger.d(
      'Deleted ${equipment != null ? "equipment ${equipment.equipmentName}" : "asset ${asset.name}"}',
    );
  }

  Future<void> init() async {
    final allResponses = await widget.irBloc.irRepository.getAllResponses(
        widget.irBloc.irConfigs.sessionRepositoryIR.selectedOutletId);
    widget.irBloc.checkIfCanSkipIrModule(allResponses);
    final assets = widget.irBloc.assetsList.value;

    for (final response in allResponses) {
      if (response.imageUploadState == IrImageUploadStateEnum.after) {
        continue;
      }
      final asset =
          assets!.firstWhereOrNull((element) => element.id == response.assetId);
      if (asset == null) {
        logger.w("Found IRResponse for non existent asset ${response.assetId}");
        continue;
      }

      if (response.equipmentId != null) {
        // it is equipment
        final equipment = asset.mappedEquipments!.firstWhereOrNull(
          (element) => element.equipmentId == response.equipmentId,
        );
        if (equipment == null) {
          logger.w(
              "Found IRResponse for non existent Equipment ${response.equipmentId}");
          continue;
        }

        if (!assetIdsOfRenderedCard.containsKey(equipment.equipmentId ?? 0)) {
          assetIdsOfRenderedCard.putIfAbsent(
            equipment.equipmentId ?? 0,
            () => 1,
          );
          selectedAssets.add(
            _getAssetCard(
              asset: asset,
              equipment: equipment,
            ),
          );
        }
      } else {
        //it is asset
        if (!assetIdsOfRenderedCard.containsKey(asset.id) ||
            response.imageUploadState == IrImageUploadStateEnum.singleImage) {
          assetIdsOfRenderedCard.update(
            asset.id,
            (val) => val + 1,
            ifAbsent: () => 1,
          );
          selectedAssets.add(
            _getAssetCard(
              asset: asset.copyWith(
                  instanceNumber: assetIdsOfRenderedCard[asset.id]!),
              equipment: null,
            ),
          );
        }
      }
    }

    setState(() {});

    if (widget.reviewFlow) {
      await autoRouteToResultsScreen();
    }
  }
}
