import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

class KeyboardController {
  final _keyboardInputSubject = PublishSubject<String?>();
  Stream<String?> get keyboardInput => _keyboardInputSubject.stream;
  void setKeyboardInput(String? input) => _keyboardInputSubject.add(input);

  final _showKeyboardSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get showKeyboard => _showKeyboardSubject.stream;
  void toggleKeyboardVisibility(value) {
    if (value == (_showKeyboardSubject.valueOrNull ?? false)) {
      return;
    }
    _showKeyboardSubject.add(value);
  }

  void dispose() {
    _keyboardInputSubject.close();
    _showKeyboardSubject.close();
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
