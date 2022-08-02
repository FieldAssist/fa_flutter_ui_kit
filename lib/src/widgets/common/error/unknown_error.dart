import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/constants/images.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/outlined_icon_button.dart';
import 'package:flutter/material.dart';

class UnknownErrorWidget extends StatelessWidget {
  const UnknownErrorWidget(
    this.onTap, {
    this.pop = true,
    this.message,
    this.errorImage = Images.superCommander,
    this.errorTitle = 'Something is wrong.',
    this.errorSubtitle = 'Supercommander FA is fixing it',
    this.showErrorImage = true,
    this.showErrorTitle = true,
    this.showErrorSubtitle = true,
  });

  final VoidCallback onTap;
  final bool pop;
  final String? message;
  final String errorImage;
  final String errorTitle;
  final String errorSubtitle;
  final bool showErrorImage;
  final bool showErrorTitle;
  final bool showErrorSubtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showErrorImage) ...[
                Image.asset(
                  errorImage,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: 50,
                )
              ],
              if (showErrorTitle) ...[
                Text(
                  errorTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
              if (showErrorSubtitle) ...[
                Text(
                  errorSubtitle,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
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
                  if (onTap != null)
                    Flexible(
                      child: OutlinedIconButton(
                        endAction: onTap,
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
        ],
      ),
    );
  }
}
