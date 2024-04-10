import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:fa_flutter_ui_kit/src/modules/common/number_keyboard/keyboard_controller.dart';
import 'package:flutter/material.dart';

import 'qty_input_text_box.dart';

class SkuItemCard extends StatefulWidget {
  const SkuItemCard({
    required this.onQtyChange,
    required this.skuName,
    required this.qtyDescription,
    required this.stdQtyDescription,
    required this.skuImage,
    this.prefillValue,
    this.stdPrefillValue,
    this.keyBoardController,
    this.topWidget,
    this.thirdButton,
    this.bottomWidget,
    this.skuDescription = "",
    super.key,
  });

  final void Function(String? stdQty, String? qty) onQtyChange;
  final String skuName;
  final String skuDescription;
  final String qtyDescription;
  final String stdQtyDescription;
  final Widget skuImage;
  final int? prefillValue;
  final int? stdPrefillValue;
  final KeyboardController? keyBoardController;
  final Widget? topWidget;
  final Widget? thirdButton;
  final Widget? bottomWidget;

  @override
  State<SkuItemCard> createState() => _SkuItemCardState();
}

class _SkuItemCardState extends State<SkuItemCard> {
  final stdQtyController = TextEditingController();
  final qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.skuImage,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.topWidget != null) widget.topWidget!,
                    Text(
                      widget.skuName,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 3,
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.skuDescription,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 10,
                            color: AppColors.kLightGrey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QtyInputTextBox(
                keyboardController: widget.keyBoardController,
                onInputChange: (value) =>
                    widget.onQtyChange(value, qtyController.text),
                textController: stdQtyController,
                qtyText: widget.stdQtyDescription,
                prefillValue: widget.stdPrefillValue,
              ),
              SizedBox(
                width: 4,
              ),
              QtyInputTextBox(
                keyboardController: widget.keyBoardController,
                onInputChange: (value) =>
                    widget.onQtyChange(stdQtyController.text, value),
                textController: qtyController,
                qtyText: widget.qtyDescription,
                prefillValue: widget.prefillValue,
              ),
              SizedBox(
                width: 4,
              ),
              if (widget.thirdButton != null) widget.thirdButton!,
            ],
          ),
          if (widget.bottomWidget != null)
            Column(
              children: [
                SizedBox(height: 4),
                widget.bottomWidget!,
              ],
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    stdQtyController.dispose();
    qtyController.dispose();
    super.dispose();
  }
}
