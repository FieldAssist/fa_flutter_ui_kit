import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../config/colors.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold({
    super.key,
    super.appBar,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary = true,
    super.drawerDragStartBehavior = DragStartBehavior.start,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture = true,
    super.endDrawerEnableOpenDragGesture = true,
    super.restorationId,
    required this.appBody,
    this.gradient,
  }) : super(
          body: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: gradient != null
                  ? gradient
                  : backgroundColor == null
                      ? LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            AppColors.kBlueColor.shade25,
                          ],
                        )
                      : null,
            ),
            child: appBody,
          ),
        );
  final Widget appBody;
  final Gradient? gradient;
}
