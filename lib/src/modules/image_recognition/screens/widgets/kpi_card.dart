import 'package:flutter/material.dart';

import '../../../../config/colors.dart';

class KpiCard extends StatelessWidget {
  const KpiCard({
    required this.value,
    required this.label,
    super.key,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
      height: 50,
      width: (MediaQuery.of(context).size.width - 48) / 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.white,
            AppColors.kFastMovingBackground,
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: AppColors.kGreyBackground,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$value",
            textAlign: TextAlign.center,
          ),
          FittedBox(
            child: Text(
              "$label",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.kLightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
