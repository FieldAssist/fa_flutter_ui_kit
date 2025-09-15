import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/app_theme_config.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/session_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../utils/cam_image_picker_util.dart';
import '../../../common/app_texts.dart';
import '../../bloc/comparison_card_bloc.dart';
import '../../bloc/ir_bloc.dart';
import '../../bloc/ir_upload_status_card_bloc.dart';
import '../../enum/image_upload_state_enum.dart';
import '../../models/ir_outlet_asset_details_model.dart';
import 'ir_upload_status_card.dart';
import '../../models/ir_assets_model.dart';
import '../../models/ir_master_model.dart';

class ImageComparisonCard extends StatefulWidget {
  const ImageComparisonCard({
    required this.label,
    required this.equipmentModel,
    required this.assetModel,
    required this.showBeforeAfterCapture,
    required this.onDelete,
    required this.irBloc,
    Key? key,
  }) : super(key: key);

  final String label;
  final IrOutletAssetDetailsModel? equipmentModel;
  final IrAssetsModel? assetModel;
  final bool showBeforeAfterCapture;
  final VoidCallback onDelete;
  final IrBloc irBloc;

  @override
  State<ImageComparisonCard> createState() => _ImageComparisonCardState();
}

class _ImageComparisonCardState extends State<ImageComparisonCard>
    with WidgetsBindingObserver {
  late ComparisonCardBloc _comparisonCardBloc;
  String? _idealImagePath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _comparisonCardBloc = ComparisonCardBloc(
      equipmentModel: widget.equipmentModel,
      assetModel: widget.assetModel,
      irBloc: widget.irBloc,
      sessionRepository: widget.irBloc.irConfigs.sessionRepositoryIR,
      skuRepository: widget.irBloc.irConfigs.skuRepositoryIR,
    );

    _idealImagePath = widget.irBloc.getIdealPlanogramImageUrl(
      widget.equipmentModel != null
          ? widget.equipmentModel?.assetDefinitionsId
          : widget.assetModel?.id,
    );

    prepareInitialImageResponse();
    _comparisonCardBloc.prepareIRList();
  }

  Future<void> prepareInitialImageResponse() async {
    await _comparisonCardBloc.updateAlreadyCapturedImages();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _comparisonCardBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Asset title with icon
            Row(
              children: [
                Icon(
                  Icons.shelves,
                  // Use appropriate icon for the asset type
                  size: 20,
                  color: Colors.grey[700],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "${widget.label} ${isDebug ? widget.equipmentModel != null ? widget.equipmentModel!.assetDefinitionsId : widget.assetModel!.id : ''}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                if (isDebug)
                  Text(
                      "${widget.equipmentModel != null ? 'equipment' : 'asset'}"),
                if (checkIfNotEmpty(_idealImagePath)) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showIdealPlanogramImage(
                        imageUrl: _idealImagePath ?? "",
                        onTap: () {},
                      );
                    },
                    child: Text(
                      AppTexts().kViewIdeal,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
                SizedBox(width: 8),
                if (!(checkIfNotEmpty(
                      _comparisonCardBloc.beforeImagePath,
                    ) ||
                    checkIfNotEmpty(_comparisonCardBloc.afterImagePath)))
                  GestureDetector(
                    onTap: widget.onDelete,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: AppColors.kRedAlpha,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5),

            // Before and After images row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Before image section
                ImageSection(
                  label: AppTexts().kBefore.toUpperCase(),
                  showLabel: widget.showBeforeAfterCapture,
                  uploadState: widget.showBeforeAfterCapture
                      ? IrImageUploadStateEnum.before
                      : IrImageUploadStateEnum.singleImage,
                  comparisonCardBloc: _comparisonCardBloc,
                  planogramImageUrl: _idealImagePath,
                ),

                const SizedBox(width: 16),

                // After image section
                if (widget.showBeforeAfterCapture)
                  ImageSection(
                    label: AppTexts().kAfter.toUpperCase(),
                    showLabel: widget.showBeforeAfterCapture,
                    uploadState: IrImageUploadStateEnum.after,
                    comparisonCardBloc: _comparisonCardBloc,
                    allowCapturingImage: true,
                    planogramImageUrl: _idealImagePath,
                  )
                else
                  Expanded(child: SizedBox.shrink()) //do not remove
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isBeforeImageFailed(List<IrMasterModel>? failedResultList) {
    if (failedResultList == null) {
      return false;
    }
    final model = failedResultList.firstWhereOrNull(
        (el) => el.imageUploadState == IrImageUploadStateEnum.before);
    if (model == null) {
      return true;
    } else {
      return false;
    }
  }

  void showIdealPlanogramImage({
    required String imageUrl,
    VoidCallback? onTap,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return PlanogramDialog(
          imageUrl: imageUrl,
          onTap: onTap,
          appThemeConfigProvider:
              widget.irBloc.irConfigs.appThemeConfigProvider,
        );
      },
    );
  }
}

class ImageSection extends StatefulWidget {
  const ImageSection({
    required this.uploadState,
    required this.comparisonCardBloc,
    this.allowCapturingImage = true,
    this.label,
    this.showLabel = true,
    this.planogramImageUrl,
    super.key,
  });

  final bool showLabel;
  final String? label;
  final IrImageUploadStateEnum uploadState;
  final ComparisonCardBloc comparisonCardBloc;
  final bool allowCapturingImage;
  final String? planogramImageUrl;

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  bool beforeImageCompliant = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.showLabel && widget.label != null)
            Text(
              widget.label!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          const SizedBox(height: 8),
          Column(
            children: [
              InkWell(
                onTap: () async {
                  if (widget.uploadState ==
                          IrImageUploadStateEnum.singleImage &&
                      widget.showLabel == false &&
                      widget.comparisonCardBloc.beforeImagePath == null &&
                      widget.planogramImageUrl != null) {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return PlanogramDialog(
                          imageUrl: widget.planogramImageUrl!,
                          onTap: () {},
                          appThemeConfigProvider: widget.comparisonCardBloc
                              .irBloc.irConfigs.appThemeConfigProvider,
                        );
                      },
                    );
                  } else if (widget.uploadState ==
                      IrImageUploadStateEnum.after) {
                    if (widget.comparisonCardBloc.beforeImagePath == null ||
                        widget.comparisonCardBloc.beforeImagePath!.isEmpty) {
                      BotToast.showText(
                        text: AppTexts().kCaptureBeforeImg,
                      );
                      return;
                    }

                    if (widget.comparisonCardBloc.beforeImagePath != null &&
                        widget.comparisonCardBloc.beforeImagePath!.isNotEmpty) {
                      if (widget.planogramImageUrl != null) {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return PlanogramDialog(
                              imageUrl: widget.planogramImageUrl!,
                              onTap: () {},
                              appThemeConfigProvider: widget.comparisonCardBloc
                                  .irBloc.irConfigs.appThemeConfigProvider,
                            );
                          },
                        );
                      }
                    }
                  }
                  await captureAndUploadImage(
                    widget.uploadState,
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/grid_view.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: widget.uploadState == IrImageUploadStateEnum.after
                          ? _getAfterImageWidget()
                          : _getBeforeImageWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          //Add logic to check quality concerns
          StreamBuilder(
            stream: widget.comparisonCardBloc.compliances,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.hasData) {
                final currentImageCompliance =
                    snapshot.data![widget.uploadState];
                if (currentImageCompliance != null &&
                    currentImageCompliance.isEmpty) {
                  beforeImageCompliant = true;
                  return Text(
                    AppTexts().kCompliant,
                    style: TextStyle(color: Colors.green),
                  );
                }
                if (checkIfListIsNotEmpty(currentImageCompliance)) {
                  return _qualityConcern(
                    currentImageCompliance!,
                    () async {
                      await captureAndUploadImage(widget.uploadState);
                    },
                  );
                }
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Future<void> captureAndUploadImage(IrImageUploadStateEnum uploadState) async {
    File? file;

    final cancel = BotToast.showLoading();
    file = await CameraImagePickerUtil().getImgFileFromCamera();
    cancel();

    if (file == null) {
      return;
    }

    // file = await appRouter.push(
    //   ImageReviewPageRoute(
    //     file: file,
    //     onSaveTap: () {
    //       Navigator.pop(context, file);
    //     },
    //     enforceCacheImageDelete: true,
    //   ),
    // ) as File?;

    if (file != null) {
      widget.comparisonCardBloc.submitImage(
        file: file,
        uploadState: uploadState,
      );
      setState(() {});
    }
  }

  Widget _getBeforeImageWidget() {
    if (widget.comparisonCardBloc.beforeImagePath == null ||
        widget.comparisonCardBloc.beforeImagePath!.isEmpty) {
      return Center(
        child: Icon(
          Icons.add_circle_outline_rounded,
          size: 25,
          color: Colors.grey,
        ),
      );
    }

    return StreamBuilder<List<IrMasterModel>?>(
      stream: widget.comparisonCardBloc.irList,
      builder: (context, snapshot) {
        final irData = snapshot.data ?? [];
        if (snapshot.data != null &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return IrUploadStatusCard(
            irMasterModel: irData[0],
            imagePath: widget.comparisonCardBloc.beforeImagePath!,
            onTapImage: () async {
              final _file = null;
              // final _file = await appRouter.push(
              //   ImageReviewPageRoute(
              //     file: null,
              //     imagePath: widget.comparisonCardBloc.beforeImagePath,
              //     onSaveTap: () {},
              //     enforceCacheImageDelete: true,
              //   ),
              // ) as File?;
              if (_file != null) {
                widget.comparisonCardBloc.submitImage(
                  file: _file,
                  uploadState: widget.uploadState,
                );
              }
            },
            imageUploadState: widget.uploadState,
            comparisonCardBloc: widget.comparisonCardBloc,
            irUploadStatusCardBloc: IrUploadStatusCardBloc(),
          );
        } else {
          return Center(child: Text("Loading.."));
        }
      },
    );
  }

  Widget _getAfterImageWidget() {
    if (widget.comparisonCardBloc.afterImagePath == null ||
        widget.comparisonCardBloc.afterImagePath!.isEmpty) {
      return Center(
        child: Icon(
          Icons.add_circle_outline_rounded,
          size: 25,
          color: Colors.grey,
        ),
      );
    }

    return StreamBuilder<List<IrMasterModel>?>(
      stream: widget.comparisonCardBloc.irList,
      builder: (context, snapshot) {
        final irData = snapshot.data ?? [];
        if (irData.length > 1) {
          return IrUploadStatusCard(
            irMasterModel: irData[1],
            imagePath: widget.comparisonCardBloc.afterImagePath!,
            onTapImage: () async {
              final _file = null;
              // final _file = await appRouter.push(
              //   ImageReviewPageRoute(
              //     file: null,
              //     imagePath: widget.comparisonCardBloc.afterImagePath,
              //     onSaveTap: () {},
              //     enforceCacheImageDelete: true,
              //   ),
              // ) as File?;
              if (_file != null) {
                widget.comparisonCardBloc.submitImage(
                  file: _file,
                  uploadState: IrImageUploadStateEnum.after,
                );
              }
            },
            imageUploadState: widget.uploadState,
            comparisonCardBloc: widget.comparisonCardBloc,
            irUploadStatusCardBloc: IrUploadStatusCardBloc(),
          );
        } else {
          return Center(child: Text('Loading..'));
        }
      },
    );
  }

  Widget _qualityConcern(List<String> concerns, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...concerns.map((concern) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/flag.png',
                height: 14,
                width: 14,
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  concern,
                  style: TextStyle(
                    color: AppColors.kRed,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          );
        }).toList(),
        // TextButton(
        //   onPressed: onPressed,
        //   child: Text(
        //     AppTexts().kTryAgain,
        //     style: TextStyle(
        //       color: Colors.red,
        //       fontSize: 12,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class PlanogramDialog extends StatelessWidget {
  const PlanogramDialog({
    required this.imageUrl,
    this.onTap,
    super.key,
    required this.appThemeConfigProvider,
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final AppThemeConfigProvider appThemeConfigProvider;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppTexts().kIdealShelfPlanogram),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: appThemeConfigProvider.appThemePrimaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (onTap != null)
              RoundedRectangleButton(
                height: 45,
                text: AppTexts().kContinueToCapture,
                color: Theme.of(context).colorScheme.primary,
                gradient: appThemeConfigProvider.appThemeGradient,
                showIcon: true,
                ontap: () {
                  Navigator.pop(context);

                  onTap!();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton({
    required this.color,
    required this.gradient,
    required this.text,
    required this.ontap,
    this.height = 52,
    this.showIcon,
    this.icon,
    this.textStyle,
    this.iconColor,
    super.key,
  });

  final Gradient? gradient;
  final Color color;
  final String text;
  final void Function()? ontap;
  final double height;
  final bool? showIcon;
  final Icon? icon;
  final TextStyle? textStyle;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
            if (showIcon ?? false) ...[
              SizedBox(
                width: 5,
              ),
              icon ??
                  Icon(
                    Icons.arrow_forward,
                    color: iconColor ?? Colors.white,
                  ),
            ],
          ],
        ),
      ),
    );
  }
}
