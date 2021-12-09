import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterCodeTextField extends StatelessWidget {
  const EnterCodeTextField({
    required this.codeController,
    this.codeMaxLength,
    this.autoValidate = false,
    Key? key,
  }) : super(key: key);

  final bool autoValidate;
  final TextEditingController codeController;
  final int? codeMaxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
          controller: codeController,
          keyboardType: TextInputType.number,
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
          autovalidateMode: (autoValidate == true) ? AutovalidateMode.always : AutovalidateMode.disabled,
          validator: (code) {
            if (code!.isEmpty) {
              return 'Please enter code';
              // TODO(someshubham): change code validation when details provided
            } else if (codeMaxLength != null && code.length < codeMaxLength!) {
              return 'Code length must equal to $codeMaxLength';
            } else if (code.length > 9 || code.length < 7) {
              return 'Please enter valid code';
            }
            return null;
          },
        ),
      ],
    );
  }
}
