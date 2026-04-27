import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    this.firstMessage = '',
    this.secondMessage = '',
    this.messageLogo,
    Key? key,
  }) : super(key: key);

  final String firstMessage;
  final String secondMessage;
  final Widget? messageLogo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          messageLogo ??
              Image.asset(
                Images.binoculars,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
          Text(
            '$firstMessage',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$secondMessage',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
