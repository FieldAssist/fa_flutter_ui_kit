import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterPhoneTextField extends StatelessWidget {
  const EnterPhoneTextField({
    required this.phoneController,
    this.autoValidate = false,
    this.validator,
    this.maxLength = 10,
    Key? key,
  }) : super(key: key);

  final bool autoValidate;
  final String? Function(String?)? validator;
  final TextEditingController phoneController;
  //for countries like Thailand,Indonesia
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[0-9]'))],
          controller: phoneController,
          keyboardType: TextInputType.phone,
          maxLength: maxLength,
          style: TextStyle(
            fontSize: 18,
          ),
          decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: '1234567890',
              labelStyle: TextStyle(
                height: 0.8,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always
              //border: const OutlineInputBorder(),
              ),
          autovalidate: autoValidate,
          validator: (validator == null)
              ? (phone) {
                  const pattern = r'(^[6-9]\d{9}$)';
                  final regExp = RegExp(pattern);
                  if (phone!.isEmpty) {
                    return 'Please enter mobile number';
                  } else if (!regExp.hasMatch(phone)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                }
              : validator!.call,
        ),
      ],
    );
  }
}
