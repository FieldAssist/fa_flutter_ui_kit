import 'package:flutter/material.dart';

class LinearGradientContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final bool isVerticalGradient;

  const LinearGradientContainer(
      {required this.child,
      required this.height,
      this.isVerticalGradient = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: this.isVerticalGradient
                  ? Alignment.topCenter
                  : Alignment.centerLeft,
              end: this.isVerticalGradient
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
              stops: const [
                0.0,
                0.4,
                0.6,
                1.0,
              ],
              colors: [
                Colors.grey[400]!,
                Colors.grey[400]!,
                Colors.grey[400]!,
                Colors.grey[400]!,
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
