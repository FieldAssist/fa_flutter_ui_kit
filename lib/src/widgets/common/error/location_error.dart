import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/outlined_icon_button.dart';
import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({
    required this.error,
    required this.onRefreshTap,
    this.pop = true,
    Key? key,
  }) : super(key: key);

  final String error;

  final bool pop;
  final VoidCallback onRefreshTap;

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
            height: 40,
          ),
          Text(
            'Unable to Fetch your Location',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (pop)
                Flexible(
                  child: OutlinedIconButton(
                    endAction: () {
                      Navigator.pop(context);
                    },
                    endIcon: Icon(Icons.keyboard_arrow_left),
                    endText: Text('GO BACK'),
                  ),
                ),
              if (onRefreshTap != null)
                Flexible(
                  child: OutlinedIconButton(
                    endAction: onRefreshTap,
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
        ],
      ),
    );
  }
}
