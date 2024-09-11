import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

class KeyboardController {
  final _keyboardInputSubject = ValueNotifier<String?>(null);
  ValueNotifier<String?> get keyboardInput => _keyboardInputSubject;
  void setKeyboardInput(String? input) => _keyboardInputSubject.value = input;

  final _showKeyboardSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get showKeyboard => _showKeyboardSubject.stream;
  void toggleKeyboardVisibility(value) => _showKeyboardSubject.add(value);

  void dispose() {
    _keyboardInputSubject.dispose();
    _showKeyboardSubject.close();
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
