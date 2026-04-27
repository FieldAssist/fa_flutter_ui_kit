import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:flutter/material.dart';

import '../outlined_icon_button.dart';

class ServerErrorWidget extends StatelessWidget {
  ///A widget to show an error returned from server api
  ///
  ///Use only when you want to display unknown error like 500 etc
  const ServerErrorWidget(this.message, this.onTap);

  final String? message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.superCommander,
            width: MediaQuery.of(context).size.shortestSide / 2,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Something is wrong.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Supercommander FA is fixing it',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TODO: Find a better way to handle go back call
              // Flexible(
              //   child: OutlinedIconButton(
              //     endAction: () {
              //       Navigator.pop(context);
              //     },
              //     endIcon: Icon(Icons.keyboard_arrow_left),
              //     endText: Text('GO BACK'),
              //   ),
              // ),
              if (onTap != null)
                Flexible(
                  child: OutlinedIconButton(
                    endAction: onTap!,
                    endIcon: Icon(
                      Icons.replay,
                      color: Colors.green,
                    ),
                    endText: Text(
                      'RETRY',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (message != null)
            SizedBox(
              height: 30,
            ),
          if (message != null)
            Text(
              message ?? '',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 10,
              ),
            ),
        ],
      ),
    );
  }
}
