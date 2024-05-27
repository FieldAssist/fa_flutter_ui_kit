import 'package:fa_flutter_ui_kit/src/modules/common/number_keyboard/keyboard_controller.dart';
import 'package:flutter/material.dart';

import 'qty_input_text_box.dart';

class SkuItemCard extends StatefulWidget {
  const SkuItemCard({
    required this.onQtyChange,
    required this.qtyDescription,
    required this.stdQtyDescription,
    required this.skuImage,
    this.prefillValue,
    this.stdPrefillValue,
    this.keyBoardController,
    this.topWidget,
    this.thirdButton,
    this.bottomWidget,
    this.skuDescription,
    this.stdQtyEditable = true,
    super.key,
  });

  final List<int>? Function(String? stdQty, String? qty) onQtyChange;
  final Widget? skuDescription;
  final String qtyDescription;
  final String stdQtyDescription;
  final Widget skuImage;
  final int? prefillValue;
  final int? stdPrefillValue;
  final KeyboardController? keyBoardController;
  final Widget? topWidget;
  final Widget? thirdButton;
  final Widget? bottomWidget;
  final bool stdQtyEditable;

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
                    SizedBox(height: 2),
                    if (widget.skuDescription != null) widget.skuDescription!,
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
              Visibility(
                visible: widget.stdQtyEditable,
                child: QtyInputTextBox(
                  keyboardController: widget.keyBoardController,
                  onInputChange: (stdQty) =>
                      onInputChange(stdQty, qtyController.text),
                  textController: stdQtyController,
                  qtyText: widget.stdQtyDescription,
                  prefillValue: widget.stdPrefillValue,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              QtyInputTextBox(
                keyboardController: widget.keyBoardController,
                onInputChange: (qty) =>
                    onInputChange(stdQtyController.text, qty),
                textController: qtyController,
                qtyText: widget.qtyDescription,
                prefillValue: widget.prefillValue,
              ),
              Spacer(),
              if (widget.thirdButton != null) ...[widget.thirdButton!],
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

  void onInputChange(String? stdQty, String? qty) {
    final qtyList = widget.onQtyChange(stdQty, qty) ?? [];
    stdQtyController.text = qtyList.firstOrNull?.toString() ?? '0';
    qtyController.text = qtyList.lastOrNull?.toString() ?? '0';
  }

  @override
  void dispose() {
    stdQtyController.dispose();
    qtyController.dispose();
    super.dispose();
  }
}
