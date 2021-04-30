import 'package:fa_flutter_ui_kit/src/utils/index.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/index.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FASplashPage extends StatefulWidget {
  final Widget errorPage;
  dynamic error;

  FASplashPage({
    required this.errorPage,
    this.error,
  });
  @override
  _FASplashPageState createState() => _FASplashPageState();
}

class _FASplashPageState extends State<FASplashPage>
    with AfterLayoutMixin<FASplashPage> {
  double _opacity = 0;

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() => _opacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.error != null
          ? widget.errorPage
          : AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _opacity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'FieldAssistLogo',
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80,
                        ),
                        child: FieldAssistLogo(
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'LaunchingGrowth',
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: LaunchingGrowthImage(
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
