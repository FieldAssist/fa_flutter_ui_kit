import 'dart:async';

import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:fa_flutter_ui_kit/src/modules/common/number_keyboard/keyboard_controller.dart';
import 'package:flutter/material.dart';

class QtyInputTextBox extends StatefulWidget {
  const QtyInputTextBox({
    required this.onInputChange,
    required this.textController,
    this.keyboardController,
    this.prefillValue,
    this.maxValue,
    this.showError = false,
    this.showButtons = true,
    this.buttonColor,
    this.borderColor,
    this.color,
    this.onFocusChanged,
    this.btnSize = 20,
    this.isEditable = true,
    this.focusNode,
    this.onEditingComplete,
    this.showValidationErrorMessage = true,
    this.minValue,
    this.shouldValidate = false,
    this.showCrossOnNonEditableField = false,
    this.qtyText,
    this.qtyTextTrailingIcon,
    this.onQtyTextTap,
    this.onQtyBoxTap,
    Key? key,
    this.isReadOnly,
    this.editStepValue = 1,
  }) : super(key: key);

  final TextEditingController textController;
  final void Function(String?) onInputChange;
  final KeyboardController? keyboardController;
  final num? prefillValue;
  final int? maxValue;
  final bool showError;
  final bool showButtons;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? color;
  final VoidCallback? onFocusChanged;
  final double btnSize;
  final bool isEditable;
  final bool showCrossOnNonEditableField;
  final NoKeyboardEditableTextFocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final String? qtyText;
  final Widget? qtyTextTrailingIcon;
  final VoidCallback? onQtyTextTap;
  final VoidCallback? onQtyBoxTap;
  final bool? isReadOnly;

  /// When `true`, shows validation error message below the counter
  final bool showValidationErrorMessage;

  /// When `true`, validator will be called on user interaction
  /// This should be true to validate min or max value
  final bool shouldValidate;

  final int? minValue;

  final num editStepValue;

  @override
  _QtyInputTextBoxState createState() => _QtyInputTextBoxState();
}

class _QtyInputTextBoxState extends State<QtyInputTextBox> {
  StreamSubscription<String?>? _keyboardValueSubs;
  bool _isAddButtonEnabled = true;
  late final NoKeyboardEditableTextFocusNode _focusNode;

  TextEditingController get textController => widget.textController;

  @override
  void initState() {
    super.initState();
    init();
    _focusNode = widget.focusNode ?? NoKeyboardEditableTextFocusNode();
  }

  @override
  void didUpdateWidget(covariant QtyInputTextBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    init();
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.prefillValue != null) {
        textController.text = widget.prefillValue.toString();
      }
    });
  }

  void _subscribeToKeyboardEvents() {
    _keyboardValueSubs ??=
        widget.keyboardController?.keyboardInput.listen((text) {
      if (text == null) {
        final newText =
            textController.text.substring(0, textController.text.length - 1);
        final newSelection =
            TextSelection.fromPosition(TextPosition(offset: newText.length));
        textController.value = textController.value
            .copyWith(text: newText, selection: newSelection);
      } else {
        final newText = textController.text + text;
        final newSelection =
            TextSelection.fromPosition(TextPosition(offset: newText.length));
        textController.value = textController.value
            .copyWith(text: newText, selection: newSelection);
      }
      widget.onInputChange(textController.text);
    });
  }

  void _unsubscribeFromKeyboardEvents() {
    _keyboardValueSubs?.cancel();
    _keyboardValueSubs = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: widget.borderColor ?? Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.showButtons)
                GestureDetector(
                  onTap: _onRemoveBtnPressed,
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove,
                        color: _isAddButtonEnabled
                            ? widget.buttonColor ??
                                Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).disabledColor,
                        size: widget.btnSize,
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Focus(
                  onFocusChange: _onFocusChange,
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      focusNode:
                          widget.keyboardController != null ? _focusNode : null,
                      enabled: widget.isEditable,
                      controller: textController,
                      cursorColor: Colors.blue,
                      onTap: widget.onQtyBoxTap,
                      onEditingComplete: widget.onEditingComplete,
                      onChanged: (qty) => widget.onInputChange(qty),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                      showCursor: true,
                      readOnly: widget.isReadOnly ??
                          widget.keyboardController != null,
                      textAlign: TextAlign.center,
                      autovalidateMode: _getAutovalidateMode(),
                      validator: !widget.shouldValidate ? null : _validateText,
                      decoration: InputDecoration(
                        hintText: !widget.isEditable &&
                                widget.showCrossOnNonEditableField
                            ? "x"
                            : null,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        isDense: true,
                        disabledBorder: InputBorder.none,
                        errorStyle: !widget.showValidationErrorMessage
                            ? TextStyle(height: 0)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.showButtons)
                GestureDetector(
                  onTap: _isAddButtonEnabled ? _onAddBtnPressed : null,
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: _isAddButtonEnabled
                            ? widget.buttonColor ??
                                Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).disabledColor,
                        size: widget.btnSize,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 4),
        if (widget.qtyText != null)
          widget.qtyTextTrailingIcon == null
              ? Text(
                  widget.qtyText ?? "",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.bold
                      ),
                )
              : GestureDetector(
                  onTap: widget.onQtyTextTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.qtyText ?? "",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.bold
                            ),
                      ),
                      if (widget.qtyTextTrailingIcon != null)
                        widget.qtyTextTrailingIcon!,
                    ],
                  ),
                ),
      ],
    );
  }

  void _onRemoveBtnPressed() {
    if (!widget.isEditable) {
      return;
    }
    FocusScope.of(context).requestFocus(_focusNode);
    final newValue = double.tryParse(textController.text) ?? 0;
    final decreasedValue = newValue > 0 ? newValue - widget.editStepValue : 0;
    final newText =
        (decreasedValue.isDouble ? decreasedValue : decreasedValue.toInt())
            .toString();
    final newSelection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );
    textController.value =
        textController.value.copyWith(text: newText, selection: newSelection);
    widget.onInputChange(textController.text);
  }

  void _onAddBtnPressed() {
    if (!widget.isEditable) {
      return;
    }
    FocusScope.of(context).requestFocus(_focusNode);
    final newValue = double.tryParse(textController.text) ?? 0;
    final increasedValue = newValue + widget.editStepValue;
    final newText =
        (increasedValue.isDouble ? increasedValue : increasedValue.toInt())
            .toString();
    final newSelection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );
    textController.value = textController.value.copyWith(
      text: newText,
      selection: newSelection,
    );
    widget.onInputChange(textController.text);
  }

  void _onFocusChange(isFocused) {
    if (widget.keyboardController == null) {
      return;
    }
    if (isFocused) {
      toggleKeyboardVisibility(true);
      FocusManager.instance.primaryFocus?.unfocus();
      FocusScope.of(context).requestFocus(_focusNode);
      _subscribeToKeyboardEvents();
    } else {
      _unsubscribeFromKeyboardEvents();
    }
  }

  void toggleKeyboardVisibility(value) =>
      widget.keyboardController?.toggleKeyboardVisibility(value);

  String? _validateText(String? value) {
    if (widget.maxValue == null && widget.minValue == null) {
      return null;
    }

    if (widget.maxValue != null || widget.minValue != null) {
      final newValue = double.tryParse(value ?? "") ?? 0;
      if (newValue == 0) {
        return null;
      }

      if (widget.minValue != null && newValue < widget.minValue!) {
        return "";
      }

      if (widget.maxValue != null && newValue > widget.maxValue!) {
        return "";
      }
    }

    return null;
  }

  AutovalidateMode? _getAutovalidateMode() {
    if (!widget.shouldValidate) {
      return null;
    }
    if (widget.maxValue != null || widget.minValue != null) {
      return AutovalidateMode.onUserInteraction;
    }
    return null;
  }

  @override
  void dispose() {
    _unsubscribeFromKeyboardEvents();
    super.dispose();
  }
}

extension NumX on num {
  bool get isDouble => this % 1 > 0;
}
