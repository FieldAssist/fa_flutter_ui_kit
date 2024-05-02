import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    this.lines = 150,
    this.leftPadding = 50,
    this.rightPadding = 20,
    super.key,
  });

  final int lines;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Row(
        children: List.generate(
          (lines) ~/ 5,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Color(0xFFCCCCCC),
              height: 1,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
