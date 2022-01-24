import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterCodeTextField extends StatelessWidget {
  const EnterCodeTextField({
    required this.codeController,
    Key? key,
  }) : super(key: key);

  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
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
          validator: (code) {
            //Code length changes from back end.
            return (code ?? "").isEmpty ? 'Please enter code' : null;
          },
        ),
      ],
    );
  }
}
