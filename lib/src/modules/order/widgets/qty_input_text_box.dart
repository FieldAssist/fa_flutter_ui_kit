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
    this.onFocusChanged,
    this.width = 80,
    this.height = 34,
    this.btnSize = 16,
    this.isEditable = true,
    this.focusNode,
    this.onEditingComplete,
    this.showValidationErrorMessage = true,
    this.minValue,
    this.shouldValidate = false,
    this.showCrossOnNonEditableField = false,
    this.qtyText,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final void Function(String?) onInputChange;
  final KeyboardController? keyboardController;
  final int? prefillValue;
  final int? maxValue;
  final bool showError;
  final bool showButtons;
  final Color? buttonColor;
  final Color? borderColor;
  final VoidCallback? onFocusChanged;
  final double width;
  final double height;
  final double btnSize;
  final bool isEditable;
  final bool showCrossOnNonEditableField;
  final NoKeyboardEditableTextFocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final String? qtyText;

  /// When `true`, shows validation error message below the counter
  final bool showValidationErrorMessage;

  /// When `true`, validator will be called on user interaction
  /// This should be true to validate min or max value
  final bool shouldValidate;

  final int? minValue;

  @override
  _QtyInputTextBoxState createState() => _QtyInputTextBoxState();
}

class _QtyInputTextBoxState extends State<QtyInputTextBox> {
  StreamSubscription<String?>? _keyboardValueSubs;
  bool _isAddButtonEnabled = true;
  late bool _showError;
  late final NoKeyboardEditableTextFocusNode _focusNode;
  TextEditingController get textController => widget.textController;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? NoKeyboardEditableTextFocusNode();
    if (widget.prefillValue != null) {
      textController.text = widget.prefillValue.toString();
    }
    if (_isMaxLimitReached()) {
      _isAddButtonEnabled = false;
    }
    _showError = widget.showError;
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
      if (_isMaxLimitReached() || _isMinLimitReached()) {
        setState(() {
          _showError = true;
        });
      } else {
        if (_showError) {
          setState(() {
            _showError = false;
          });
        }
      }
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
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: widget.borderColor ?? Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.showButtons)
                GestureDetector(
                  onTap: _onRemoveBtnPressed,
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    Icons.remove,
                    color: _isAddButtonEnabled
                        ? widget.buttonColor ??
                            Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).disabledColor,
                    size: widget.btnSize,
                  ),
                ),
              Focus(
                onFocusChange: _onFocusChange,
                child: Container(
                  width: 30,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode:
                        widget.keyboardController != null ? _focusNode : null,
                    enabled: widget.isEditable,
                    controller: textController,
                    cursorColor: Colors.blue,
                    onEditingComplete: widget.onEditingComplete,
                    onChanged: (qty) => widget.onInputChange(qty),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black),
                    showCursor: true,
                    readOnly: widget.keyboardController != null,
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
              if (widget.showButtons)
                GestureDetector(
                  onTap: _isAddButtonEnabled ? _onAddBtnPressed : null,
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    Icons.add,
                    color: _isAddButtonEnabled
                        ? widget.buttonColor ??
                            Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).disabledColor,
                    size: widget.btnSize,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 4),
        if (widget.qtyText != null)
          Text(
            widget.qtyText ?? "",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.kLightGrey,
                ),
          ),
      ],
    );
  }

  void _onRemoveBtnPressed() {
    FocusScope.of(context).requestFocus(_focusNode);
    final newValue = double.tryParse(textController.text) ?? 0;
    final decreasedValue = newValue > 0 ? newValue - 1 : 0;
    final newText = decreasedValue.toInt().toString();
    final newSelection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );
    textController.value =
        textController.value.copyWith(text: newText, selection: newSelection);
    widget.onInputChange(textController.text);
    if (!_isMaxLimitReached()) {
      setState(() {
        _isAddButtonEnabled = true;
      });
    }
  }

  void _onAddBtnPressed() {
    FocusScope.of(context).requestFocus(_focusNode);
    final newValue = double.tryParse(textController.text) ?? 0;
    final increasedValue = newValue + 1;
    final newText = increasedValue.toInt().toString();
    final newSelection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );
    textController.value = textController.value.copyWith(
      text: newText,
      selection: newSelection,
    );
    widget.onInputChange(textController.text);
    if (_isMaxLimitReached()) {
      setState(() {
        _isAddButtonEnabled = false;
      });
    }
  }

  void _onFocusChange(isFocused) {
    if (widget.keyboardController == null) {
      return;
    }
    if (isFocused) {
      FocusManager.instance.primaryFocus?.unfocus();
      FocusScope.of(context).requestFocus(_focusNode);
      _subscribeToKeyboardEvents();
    } else {
      _unsubscribeFromKeyboardEvents();
    }
  }

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

  // This is to check whether the max Value is reached or not
  bool _isMaxLimitReached() {
    // If there is no max value set
    // then there is no need to check for the enabling of the button
    // if (widget.maxValue == null) {
    //   return false;
    // }
    final newValue = double.tryParse(textController.text) ?? 0;
    return newValue > (widget.maxValue ?? 999999);
  }

  // This is to check whether the max Value is reached or not
  bool _isMinLimitReached() {
    // If there is no max value set
    // then there is no need to check for the enabling of the button
    if (widget.minValue == null) {
      return false;
    }
    final newValue = double.tryParse(textController.text) ?? 0;
    if (newValue == 0) {
      return false;
    }
    return newValue < (widget.minValue ?? 0);
  }

  @override
  void dispose() {
    _unsubscribeFromKeyboardEvents();
    super.dispose();
  }
}
