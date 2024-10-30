import 'package:flutter/material.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({
    this.text,
    this.iconData,
    this.onTap,
  });

  final VoidCallback? onTap;

  final String? text;

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text != null && text!.isNotEmpty ? text! : "No items found",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
