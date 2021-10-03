import 'package:fa_flutter_ui_kit/src/modules/common/generic_data_loading/shimmer_widgets.dart';
import 'package:flutter/material.dart';

class AnimatedLoader extends StatelessWidget {
  const AnimatedLoader({required this.progress});

  final int progress;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      height: 8,
      width: width,
      decoration: BoxDecoration(
        // color: Theme.of(context).disabledColor,
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Stack(
        children: [
          Container(),
          CustomShimmer(
            baseColor: Theme.of(context).accentColor,
            highlightColor: Theme.of(context).primaryColorDark,
            child: AnimatedContainer(
              height: 8,
              width: width * (progress / 100),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              duration: Duration(milliseconds: 500),
            ),
          ),
        ],
      ),
    );
  }
}