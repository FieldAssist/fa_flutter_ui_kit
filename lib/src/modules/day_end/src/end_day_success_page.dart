import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/company_logo.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/outlined_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class EndDaySuccessPage extends StatefulWidget {
  final Function onEndAction;

  const EndDaySuccessPage({required this.onEndAction});

  @override
  _EndDaySuccessPageState createState() => _EndDaySuccessPageState();
}

class _EndDaySuccessPageState extends State<EndDaySuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              child: CompanyLogo(),
            ),
            Container(
              height: 200,
              child: Image.asset(Images.thumbsUp),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                Texts.dayEndSuccess,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      Colors.green, //TODO: (Samvit) Define green in main theme
                ),
              ),
            ),
            if (isDebug)
              Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 16),
                child: OutlinedIconButton(
                  endAction: () => widget.onEndAction.call(),
                  endIcon: Icon(Icons.rotate_right),
                  endText: Text('RESTART DAY'),
                ),
              ),
            Container(
              height: 40,
              child: OutlinedIconButton(
                endAction: () {
                  SystemNavigator.pop();
                },
                endIcon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                endText: Text(
                  'CLOSE APP',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
