import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

class PrimaryRaisedButton extends StatelessWidget {
  const PrimaryRaisedButton({
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.icon,
  });

  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? OutlinedButton.icon(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
              backgroundColor: MaterialStatePropertyAll(color ?? Colors.blue),
              textStyle:
                  MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            ),
            icon: Icon(
              icon,
              size: 20,
            ),
            onPressed: onTap,
            label: Text(
              checkIfNotEmpty(text) ? text : 'NA',
              style: TextStyle(
                color: textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
              backgroundColor: MaterialStatePropertyAll(color ?? Colors.blue),
              textStyle:
                  MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            ),
            onPressed: onTap,
            child: Text(
              checkIfNotEmpty(text) ? text : 'NA',
              style: TextStyle(
                color: textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
