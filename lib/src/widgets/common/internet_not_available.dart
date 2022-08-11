import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable(this.onTap);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            /* SvgPicture.asset(
              Svgs.offline,
              height: 86,
            ),
            SizedBox(
              height: 24,
            ),*/
            Image.asset(
              Images.noInternet,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              Constants.errorInternetError,
              textAlign: TextAlign.center,
            ),
            /* SizedBox(
              height: 24,
            ),
            PrimaryRaisedButton(text: "REFRESH", onTap: onTap),*/
            if (onTap != null)
              ElevatedButton(
                onPressed: onTap,
                child: Text('REFRESH'),
              )
          ],
        ),
      ),
    );
  }
}
