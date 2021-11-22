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
        ? RaisedButton.icon(
            icon: Icon(
              icon,
              size: 20,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: color ?? Colors.blue,
            textColor: Colors.white,
            onPressed: onTap,
            label: Text(
              checkIfNotEmpty(text) ? text : 'NA',
              style: TextStyle(
                color: textColor ?? Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: color ?? Colors.blue,
            textColor: Colors.white,
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
