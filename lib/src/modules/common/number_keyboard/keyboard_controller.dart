import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

class KeyboardController {
  final _keyboardInputSubject = PublishSubject<String?>();

  Stream<String?> get keyboardInput => _keyboardInputSubject.stream;

  void setKeyboardInput(String? input) => _keyboardInputSubject.add(input);

  void dispose() {
    _keyboardInputSubject.close();
  }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
