import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // OtpTextField(
        //   obscureText: true,
        //   numberOfFields: 4,
        //   borderColor: Colors.grey,
        //   focusedBorderColor: Colors.black,
        //   showFieldAsBox: false,
        //   borderWidth: 4.0,
        //   onCodeChanged: (String code) {},
        //   onSubmit: (code) {},
        // ),
      ],
    );
  }
}
