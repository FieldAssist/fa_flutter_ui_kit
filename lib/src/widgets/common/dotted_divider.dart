import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    super.key,
    this.lines = 150,
  });

  final int lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 20),
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
