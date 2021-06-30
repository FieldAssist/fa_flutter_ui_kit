import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterCodeTextField extends StatelessWidget {
  const EnterCodeTextField({
    required this.codeController,
    required this.codeMaxLength,
    this.autoValidate = false,
    Key? key,
  }) : super(key: key);

  final bool autoValidate;
  final TextEditingController codeController;
  final int codeMaxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[0-9]'))],
          controller: codeController,
          keyboardType: TextInputType.number,
          maxLength: codeMaxLength,
          style: TextStyle(
            letterSpacing: 6,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: 'Enter Code',
            labelStyle: TextStyle(
              height: 0.8,
              letterSpacing: 0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          autovalidate: autoValidate,
          validator: (code) {
            if (code!.isEmpty) {
              return 'Please enter code';
              // TODO(someshubham): change code validation when details provided
            } else if (code.length < codeMaxLength) {
              return 'Please enter valid code';
            }
            return null;
          },
        ),
      ],
    );
  }
}
