import 'package:dartx/dartx.dart';

// import 'package:fa_flo/modules/planning/daily_planning_card.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/bloc/ir_bloc.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/app_theme_config.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/screens/widgets/planogram_comparison_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/colors.dart';
import '../../../common/app_texts.dart';
import '../../enum/kpi_enum.dart';
import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';
import '../../models/ir_planogram.dart';
import '../../models/task_status.dart';
import 'ir_sku_details_widget.dart';
import 'kpi_card.dart';

class IrResultCardNew extends StatefulWidget {
  const IrResultCardNew({
    required this.irMasterModel,
    required this.irResultsNavBar,
    required this.listOfAssets,
    required this.listOfEquipments,
    required this.onTapCategoryButton,
    required this.dragPosition,
    required this.onProceed,
    required this.irBloc,
    super.key,
  });

  final IrMasterModel irMasterModel;
  final IrResultsNavBar irResultsNavBar;
  final List<IrAssetsModel> listOfAssets;
  final List<IrOutletAssetDetailsModel> listOfEquipments;
  final VoidCallback onProceed;
  final Function(int, double) onTapCategoryButton;
  final IrBloc irBloc;

  /// Refactor, quick fix
  final double dragPosition;

  @override
  State<IrResultCardNew> createState() => _IrResultCardNewState();
}

class _IrResultCardNewState extends State<IrResultCardNew> {
  double _sheetPosition = 0.0; // Initial sheet position (40%)
  final TransformationController transformationController =
      TransformationController();
  final double maxScale = 2.5, minScale = 1, scaleFactor = 0.5;

  // final _nomenclature =
  //     locator<CompanyConfigProvider>().companyConfig?.nomenClature;

  @override
  void initState() {
    super.initState();
    _sheetPosition = widget.dragPosition;
    WidgetsBinding.instance.addPostFrameCallback((_) => _preCacheImage());
  }

  Future<void> _preCacheImage() async {
    if (widget.irMasterModel.irResponseModel != null) {
      await precacheImage(
        CachedNetworkImageProvider(
          widget.irMasterModel.irResponseModel!.imageURL,
        ),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ninetyPercentOfScreenHeight =
        MediaQuery.of(context).size.height * 0.95;

    if (widget.irMasterModel.irResponseModel == null) {
      if (widget.irMasterModel.syncStatus == TaskStatus.fail) {
        return _syncFailUi();
      } else if (widget.irMasterModel.syncStatus == TaskStatus.pending &&
          !widget.irMasterModel.internetAvailable) {
        return _syncPendingUi();
      }
    }
    return Stack(
      children: [
        // Image section - 60% of screen height
        Container(
          height: ninetyPercentOfScreenHeight,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: widget.irMasterModel.irResponseModel!.imageURL,
            fit: BoxFit.contain,
            imageBuilder: (context, imageProvider) => Stack(
              children: [
                InteractiveViewer(
                  minScale: minScale,
                  maxScale: maxScale,
                  transformationController: transformationController,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 24,
                  right: 16,
                  child: Card(
                    color: Colors.white.withOpacityFactor(.75),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await HapticFeedback.lightImpact();
                            final matrixScale = transformationController.value;
                            final scaleValue = matrixScale.getMaxScaleOnAxis();
                            if (scaleValue < maxScale) {
                              transformationController.value =
                                  Matrix4.identity()
                                    ..scale(scaleValue + scaleFactor);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.add),
                          ),
                        ),
                        Divider(),
                        GestureDetector(
                          onTap: () async {
                            await HapticFeedback.lightImpact();
                            final matrixScale = transformationController.value;
                            final scaleValue = matrixScale.getMaxScaleOnAxis();
                            if (scaleValue > minScale) {
                              transformationController.value =
                                  Matrix4.identity()
                                    ..scale(scaleValue - scaleFactor);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: widget.irBloc.irConfigs.appThemeConfigProvider
                    .appThemePrimaryColor,
              ),
            ),
          ),
        ),

        // Back button at top left
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacityFactor(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),

        // Bottom navigation bar for image controls - positioned relative to the draggable sheet
        if (widget.irResultsNavBar.beforeAfterEnabled ||
            widget.irResultsNavBar.prevNextEnabled)
          AnimatedPositioned(
            duration: Duration(milliseconds: 50),
            bottom: MediaQuery.of(context).size.height * _sheetPosition,
            left: 20,
            right: 20,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacityFactor(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: widget.irResultsNavBar,
            ),
          ),

        // Draggable IR results panel that can scroll above the image
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            setState(() {
              _sheetPosition = notification.extent;
            });
            return true;
          },
          child: DraggableScrollableSheet(
            initialChildSize: _sheetPosition, // Initially shows 40% of screen
            minChildSize: 0.1, // Can be minimized to 20% of screen
            maxChildSize: 0.80, // Can expand to 80% of screen
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacityFactor(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag handle indicator
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppTexts().kIrResults,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                if (_sheetPosition <= 0.15)
                                  ElevatedButton(
                                    // height: 42,
                                    // gradient: widget
                                    //     .irBloc
                                    //     .irConfigs
                                    //     .appThemeConfigProvider
                                    //     .appThemeGradient,
                                    // color: widget
                                    //     .irBloc
                                    //     .irConfigs
                                    //     .appThemeConfigProvider
                                    //     .appThemeGradient,
                                    onPressed: () async => widget.onProceed(),
                                    child: Text(
                                      AppTexts().kProceed,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 14),
                            // Category selection buttons
                            SizedBox(
                              height: 45,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.listOfAssets.length +
                                    widget.listOfEquipments.length,
                                itemBuilder: (context, index) {
                                  // Determine if this is an asset or equipment
                                  if (index < widget.listOfAssets.length) {
                                    // Asset item
                                    return CategoryButton(
                                      label: widget.listOfAssets[index].name,
                                      isSelected: index ==
                                          widget.irResultsNavBar.currentIndex,
                                      onTap: () => widget.onTapCategoryButton(
                                          index, _sheetPosition),
                                      appThemeConfigProvider: widget.irBloc
                                          .irConfigs.appThemeConfigProvider,
                                    );
                                  } else {
                                    // Equipment item
                                    final equipmentIndex =
                                        index - widget.listOfAssets.length;
                                    return CategoryButton(
                                      label: widget
                                          .listOfEquipments[equipmentIndex]
                                          .equipmentName,
                                      isSelected: index ==
                                          widget.irResultsNavBar.currentIndex,
                                      onTap: () => widget.onTapCategoryButton(
                                          index, _sheetPosition),
                                      appThemeConfigProvider: widget.irBloc
                                          .irConfigs.appThemeConfigProvider,
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 24),
                            // Metrics row 1
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: KpiCard(
                                    value:
                                        "${widget.irMasterModel.irResponseModel!.brandSkuCount.toStringAsFixed(2)}",
                                    label: widget.irBloc.irConfigs.isUserJsr
                                        ? AppTexts().kUBLFacings
                                        : AppTexts().kBrandFacings,
                                    //AppTexts().kBrandSkuCount,
                                  ),
                                ),
                                Expanded(
                                  child: KpiCard(
                                    value:
                                        "${widget.irMasterModel.irResponseModel!.shelfSharePercent.toStringAsFixed(2)}%",
                                    label: widget.irBloc.irConfigs.isUserJsr
                                        ? AppTexts().kUBShelfShare
                                        : AppTexts().kShareOfShelf,
                                    //AppTexts().kShelfShare,
                                  ),
                                ),
                                if (_getMustSellDataFromResponse() != null)
                                  Expanded(
                                    child: KpiCard(
                                      value:
                                          "${_getMustSellDataFromResponse()!.toStringAsFixed(2)}%",
                                      label: AppTexts().kMustSell,
                                    ),
                                  ),
                              ],
                            ),
                            // Metrics row 2
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: KpiCard(
                                    value:
                                        "${widget.irMasterModel.irResponseModel!.totalObjectCount.toStringAsFixed(2)}",
                                    label: AppTexts().kTotalFacings,
                                    //AppTexts().kTotalObjectCount,
                                  ),
                                ),
                                Expanded(
                                  child: KpiCard(
                                    value:
                                        "${widget.irMasterModel.irResponseModel!.assetScore.toStringAsFixed(2)}",
                                    label: AppTexts().kAssetScore,
                                  ),
                                ),
                                if (_getPremiumSkuDataFromResponse() != null)
                                  Expanded(
                                    child: KpiCard(
                                      value:
                                          "${_getPremiumSkuDataFromResponse()!.toStringAsFixed(2)}%",
                                      label: AppTexts().kPremiumSku,
                                    ),
                                  ),
                              ],
                            ),

                            //added this temporarily
                            _buildCoolerPurityClassificationTile(),

                            SizedBox(height: 16),

                            // Planogram compliance
                            if (widget
                                    .irMasterModel.irResponseModel!.planogram !=
                                null)
                              _getPlanogramComplianceUi(widget
                                  .irMasterModel.irResponseModel!.planogram!),

                            SizedBox(height: 10),

                            // SKU Details section
                            _getIrSkuDetails(),

                            // Add extra space at bottom for proceed button
                            SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Fixed Proceed button at bottom
        if (_sheetPosition > 0.15)
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: GestureDetector(
              onTap: widget.onProceed,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: widget
                      .irBloc.irConfigs.appThemeConfigProvider.appThemeGradient,
                  color: widget.irBloc.irConfigs.appThemeConfigProvider
                      .appThemePrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTexts().kProceed,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _syncFailUi() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .055,
        ),
        child: GestureDetector(
          onTap: () {
            // _retakeImage
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
                    widget.irMasterModel.uploadImageFailedReason,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getIrSkuDetails() {
    final allMustSellSkuIds =
        widget.irBloc.irConfigs.skuRepositoryIR.mustSellSkus.toSet();
    // final allSkus = locator<OrderBloc>().skuRepo.idVsSkus;
    final allPremiumSkuIds =
        widget.irBloc.irConfigs.skuRepositoryIR.premiumSkus;

    // for (final sku in allSkus.values) {
    //   if (sku.attributeText1.toString().toLowerCase() == 'premium') {
    //     allPremiumSkuIds.add(sku.id);
    //   }
    // }

    return IrSkuDetailsWidget(
      filteredMustSellSku: widget.irMasterModel.irResponseModel!.products
          .where((element) => allMustSellSkuIds.contains(int.parse(element.id)))
          .toList(),
      filteredPremiumSku: widget.irMasterModel.irResponseModel!.products
          .where((element) => allPremiumSkuIds.contains(int.parse(element.id)))
          .toList(),
      filteredOtherSku: widget.irMasterModel.irResponseModel!.products
          .where((element) =>
              !allMustSellSkuIds.contains(int.parse(element.id)) &&
              !allPremiumSkuIds.contains(int.parse(element.id)))
          .toList(),
      irProductResponse: widget.irMasterModel.irResponseModel!.products,
    );
  }

  Widget _syncPendingUi() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .055,
        ),
        child: GestureDetector(
          onTap: () async {},
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

  Widget _getPlanogramComplianceUi(IrPlanogram planogram) {
    return GestureDetector(
      onTap: () {
        final currentIndex = widget.irResultsNavBar.currentIndex;
        final assetsLength = widget.listOfAssets.length;
        final idealImage = widget.irBloc.getIdealPlanogramImageUrl(
          currentIndex < assetsLength
              ? widget.listOfAssets[currentIndex].id
              : widget.listOfEquipments[currentIndex - assetsLength]
                  .assetDefinitionsId,
        );
        if (idealImage == null) {
          BotToast.showText(text: AppTexts().kIdealPlanogramIssue);
          return;
        }
        if (planogram.planogramSkuOutputImage == null) {
          BotToast.showText(text: AppTexts().kPlanogramImageIssue);
          return;
        }
        showPlanogramComparisonDialog(
          context: context,
          idealImageUrl: idealImage,
          capturedImageUrl: planogram.planogramSkuOutputImage!,
          insights: planogram.planogramIssues ?? [],
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Colors.white,
              AppColors.kFastMovingBackground,
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: AppColors.kGreyBackground,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Planogram thumbnail with View Ideal button
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: CachedNetworkImage(
                        imageUrl: planogram.planogramSkuOutputImage ??
                            widget.irMasterModel.irResponseModel!.imageURL,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacityFactor(0.3),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Center(
                          child: Text(
                            'View Ideal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppTexts().kPlanogramCompliance,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color:
                                  planogram.complianceStatus?.toLowerCase() ==
                                          AppTexts().kFail.toLowerCase()
                                      ? Colors.red
                                      : Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${planogram.complianceStatus}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (planogram.compliancePercentage != null)
                        Text(
                          '${planogram.compliancePercentage!.toStringAsFixed(2)} %',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      SizedBox(height: 8),
                      if (planogram.planogramIssues?.isNotEmpty ?? false)
                        Text(
                          "${planogram.planogramIssues?.first}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            AppTexts().kImproveScoreMsg,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFAC2640),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xFFAC2640),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showPlanogramComparisonDialog({
    required BuildContext context,
    required String idealImageUrl,
    required String capturedImageUrl,
    required List<String> insights,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: PlanogramComparisonDialog(
            idealImageUrl: idealImageUrl,
            capturedImageUrl: capturedImageUrl,
            insights: insights,
            appThemeConfigProvider:
                widget.irBloc.irConfigs.appThemeConfigProvider,
          ),
        );
      },
    );
  }

  double? _getMustSellDataFromResponse() {
    final kpiResponse = widget.irMasterModel.irResponseModel!.kpiWeightage
        .firstOrNullWhere(
            (element) => element.kpiEnum == IrKpiEnum.mustSellSKUCount);
    if (kpiResponse == null) {
      return null;
    }
    return kpiResponse.result;
  }

  double? _getPremiumSkuDataFromResponse() {
    final kpiResponse =
        widget.irMasterModel.irResponseModel!.kpiWeightage.firstOrNullWhere(
      (element) => element.kpiEnum == IrKpiEnum.premiumSkuCount,
    );
    if (kpiResponse == null) {
      return null;
    }
    return kpiResponse.result;
  }

  String? _getCoolerPurityClassificationDataFromResponse() {
    final kpiResponse =
        widget.irMasterModel.irResponseModel!.kpiWeightage.firstOrNullWhere(
      (element) => element.kpiEnum == IrKpiEnum.coolerPurity,
    );

    if (kpiResponse == null) {
      return null;
    }

    final percentage = kpiResponse.result ?? 0;
    if (percentage >= 0 && percentage <= 30) {
      return AppTexts().kBad;
    } else if (percentage > 30 && percentage <= 70) {
      return AppTexts().kAverage;
    } else if (percentage > 70) {
      return AppTexts().kGood;
    }

    return "---";
  }

  Widget _buildCoolerPurityClassificationTile() {
    final cpClassification = _getCoolerPurityClassificationDataFromResponse();
    if (cpClassification != null) {
      return Row(
        children: [
          Expanded(
            child: KpiCard(
              value: "$cpClassification",
              label: AppTexts().kCoolerPurityClassification,
              //AppTexts().kShelfShare,
            ),
          ),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.appThemeConfigProvider,
    super.key,
  });

  final bool isSelected;
  final String label;
  final VoidCallback onTap;
  final AppThemeConfigProviderIR appThemeConfigProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: isSelected ? appThemeConfigProvider.appThemeGradient : null,
          color: isSelected
              ? appThemeConfigProvider.appThemePrimaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Text(
            '$label',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class IrResultsNavBar extends StatelessWidget {
  const IrResultsNavBar({
    required this.onBeforePressed,
    required this.onAfterPressed,
    required this.onPrevPressed,
    required this.onNextPressed,
    required this.currentIndex,
    required this.assetIndex,
    required this.maxIndex,
    required this.beforeAfterEnabled,
    required this.prevNextEnabled,
    super.key,
  });

  final int currentIndex;
  final int assetIndex;
  final int maxIndex;
  final VoidCallback onBeforePressed;
  final VoidCallback onAfterPressed;
  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;
  final bool beforeAfterEnabled;
  final bool prevNextEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (beforeAfterEnabled)
          NavButton(
            label: 'Before',
            icon: Icon(Icons.arrow_drop_up),
            onTap: onBeforePressed,
          ),
        // Text(
        //   '${currentImageIndex + 1}/${maxImageIndex + 1}',
        // ),
        if (beforeAfterEnabled)
          NavButton(
            label: 'After',
            icon: Icon(Icons.arrow_drop_down),
            onTap: onAfterPressed,
          ),
        if (prevNextEnabled) ...[
          NavButton(
            label: 'Prev',
            icon: Icon(Icons.arrow_left),
            onTap: onPrevPressed,
          ),
          Text(
            '${assetIndex + 1}/${maxIndex + 1}',
          ),
          NavButton(
            label: 'Next',
            icon: Icon(Icons.arrow_right),
            onTap: onNextPressed,
          ),
        ],
      ],
    );
  }
}
