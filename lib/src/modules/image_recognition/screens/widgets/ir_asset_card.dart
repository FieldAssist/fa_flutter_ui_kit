import 'package:fa_flutter_ui_kit/src/modules/image_recognition/bloc/ir_bloc.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/session_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';
import 'package:flutter/material.dart';

import '../../models/ir_assets_model.dart';
import '../../models/ir_outlet_asset_details_model.dart';
import 'image_comparison_card.dart';

class IrAssetCard extends StatefulWidget {
  const IrAssetCard({
    required this.irAssetModel,
    required this.allowBeforeAfterCapture,
    required this.equipment,
    required this.onDelete,
    super.key, required this.irBloc,
  });

  final IrAssetsModel? irAssetModel;
  final bool allowBeforeAfterCapture;
  final IrOutletAssetDetailsModel? equipment;
  final Function(IrAssetCard) onDelete;
  final IrBloc irBloc;

  @override
  State<IrAssetCard> createState() => _IrAssetCardState();
}

class _IrAssetCardState extends State<IrAssetCard> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(IrAssetCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ImageComparisonCard(
        label: widget.equipment != null
            ? widget.equipment?.equipmentName ??
                widget.equipment?.assetName ??
                "---"
            : widget.irAssetModel!.name,
        equipmentModel: widget.equipment,
        assetModel: widget.irAssetModel,
        showBeforeAfterCapture: widget.allowBeforeAfterCapture,
        onDelete: () => widget.onDelete(widget),
        irBloc: widget.irBloc,
      ),
    );
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
