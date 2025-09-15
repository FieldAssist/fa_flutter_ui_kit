import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../bloc/comparison_card_bloc.dart';
import '../../bloc/ir_upload_status_card_bloc.dart';
import '../../enum/image_upload_state_enum.dart';
import '../../models/ir_master_model.dart';
import '../../models/task_status.dart';

class IrUploadStatusCard extends StatelessWidget {
  const IrUploadStatusCard({
    required this.imagePath,
    required this.irMasterModel,
    required this.onTapImage,
    required this.comparisonCardBloc,
    required this.imageUploadState,
    required this.irUploadStatusCardBloc,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final IrMasterModel irMasterModel;
  final VoidCallback onTapImage;
  final ComparisonCardBloc comparisonCardBloc;
  final IrImageUploadStateEnum imageUploadState;
  final IrUploadStatusCardBloc irUploadStatusCardBloc;

  @override
  Widget build(BuildContext context) {
    irUploadStatusCardBloc.progress(irMasterModel);
    return StreamBuilder<bool?>(
      stream: irUploadStatusCardBloc.progressStream,
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          if (snapshot.data! &&
              irUploadStatusCardBloc.prevVisit!.syncStatus ==
                  TaskStatus.completed) {
            comparisonCardBloc.checkKpiComplianceForAsset(
                imageUploadState: imageUploadState);
            return getChildCard(AppColors.kGreen);
          } else if (!snapshot.data! &&
              irUploadStatusCardBloc.prevVisit!.syncStatus == TaskStatus.fail) {
            return getChildCard(AppColors.kRed, showRetry: true);
          } else {
            return getChildCard(AppColors.kHomeYellow);
          }
        }
        return getChildCard(Colors.transparent);
      },
    );
  }

  Widget getChildCard(Color color, {bool showRetry = false}) => GestureDetector(
        onTap: onTapImage,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: color,
                    width: 1.27,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  height: 62,
                  width: 62,
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      fit: BoxFit.cover,
                      File(
                        imagePath,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (showRetry)
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.replay,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}
