import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({required this.onRetry});

  final VoidCallback onRetry;

  @override
  _NoInternetWidget createState() => _NoInternetWidget();
}

class _NoInternetWidget extends State<NoInternetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: BottomActionButton(
        title: 'Retry',
        color: Colors.grey[100]!,
        titleColor: Colors.green,
        onPressed: () => widget.onRetry(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          SvgAssetImage(
            path: SvgIcons.cloudOff,
            height: 250,
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Mobile Data is Off",
              style: TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Turn it on to load this page.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
