import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterPhoneTextField extends StatelessWidget {
  const EnterPhoneTextField({
    @required this.phoneController,
    this.autoValidate = false,
    Key key,
  }) : super(key: key);

  final bool autoValidate;
  final TextEditingController phoneController;

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
          maxLength: 13,
          style: TextStyle(
            fontSize: 18,
          ),
          decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: '123-456-7890',
              labelStyle: TextStyle(
                height: 0.8,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always
              //border: const OutlineInputBorder(),
              ),
          autovalidate: autoValidate,
          validator: (phone) {
            const pattern = r'(^[6-9]\d{9}$)';
            final regExp = RegExp(pattern);
            if (phone.isEmpty) {
              return 'Please enter mobile number';
            } else if (!regExp.hasMatch(phone)) {
              return 'Please enter valid mobile number';
            }
            return null;
          },
        ),
      ],
    );
  }
}
