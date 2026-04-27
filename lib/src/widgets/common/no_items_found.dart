import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({
    this.text,
    this.iconData,
    this.onTap,
    this.subTitle,
  });

  final VoidCallback? onTap;

  final String? text;

  final IconData? iconData;

  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/images/empty_carton.png",
              package: 'fa_flutter_ui_kit',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text != null && text!.isNotEmpty ? text! : "No items found",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (checkIfNotEmpty(subTitle)) ...[
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    subTitle ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
