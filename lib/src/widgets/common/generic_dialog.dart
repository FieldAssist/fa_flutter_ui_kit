import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    Key? key,
    this.title,
    this.subtitle,
    this.leftActionText,
    this.rightActionText,
    this.leftActionIdentifier,
    this.rightActionIdentifier,
    this.dialogIdentifier,
    this.leftButtonFunction,
    this.rightButtonFunction,
    this.subDescription,
    this.buttonBgColor = Colors.transparent,
    this.buttonTextBgColor,
    this.rightTextColor,
    this.rightButtonBgColor,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? leftActionText;
  final String? rightActionText;

  /// Optional accessibility identifiers, surfaced as the platform's
  /// accessibility id (Android `resource-id`).
  ///
  /// Exist so UI tests can target this dialog and its actions by stable ids
  /// rather than by label. Labels here are a poor selector: they are supplied
  /// per call site and localized, and the two actions are frequently a
  /// destructive/non-destructive pair (e.g. "Refresh" vs "Yes") where matching
  /// the wrong one silently takes a different code path.
  ///
  /// All null by default — `Semantics` with a null identifier adds no id, so
  /// existing callers are unaffected.
  final String? leftActionIdentifier;
  final String? rightActionIdentifier;

  /// Identifies the dialog itself, for asserting it is (or is not) shown.
  final String? dialogIdentifier;
  final Function? rightButtonFunction;
  final Function? leftButtonFunction;
  final String? subDescription;
  final Color buttonBgColor;
  final Color? buttonTextBgColor;
  final Color? rightTextColor;
  final Color? rightButtonBgColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: dialogIdentifier,
      // Without explicitChildNodes the dialog's descendants are merged into
      // this node and THIS identifier wins, which would make the action
      // identifiers below unreachable. Keeping child nodes explicit lets the
      // dialog and its buttons be addressed independently.
      explicitChildNodes: true,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title ?? ''),
        titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
        contentPadding: EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subtitle ?? '',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              subDescription ?? "",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            if (subDescription?.isNotEmpty ?? false)
              SizedBox(
                height: 20,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                if (leftButtonFunction != null && leftActionText != null)
                  Expanded(
                    child: Semantics(
                      identifier: leftActionIdentifier,
                      child: OutlinedButton(
                        onPressed: () => leftButtonFunction?.call(),
                        child: Text(
                          leftActionText!,
                          style: TextStyle(
                            color: buttonTextBgColor ?? Colors.blue[600],
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) => buttonBgColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Semantics(
                    identifier: rightActionIdentifier,
                    child: OutlinedButton(
                      onPressed: () {
                        if (rightButtonFunction != null) {
                          rightButtonFunction?.call();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        rightActionText ?? 'Okay',
                        style: TextStyle(
                          color: rightTextColor ??
                              buttonTextBgColor ??
                              Colors.blue[600],
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) => rightButtonBgColor ?? buttonBgColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
