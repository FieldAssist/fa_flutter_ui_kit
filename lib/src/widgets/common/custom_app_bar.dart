import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

class CustomAppBar extends AppBar {
  CustomAppBar({
    Widget? leading,
    required Widget title,
    List<Widget>? actions,
    SystemUiOverlayStyle? systemOverlayStyle,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true,
    IconThemeData? iconTheme,
    bool? centerTitle,
    Color? backgroundColor,
    double? leadingWidth,
    double? titleSpacing,
    double? toolbarHeight,
    double? elevation,
    Color? shadowColor,
    bool forceMaterialTransparency = false,
  }) : super(
          systemOverlayStyle: systemOverlayStyle,
          elevation: elevation,
          toolbarHeight: toolbarHeight,
          iconTheme: iconTheme,
          forceMaterialTransparency: forceMaterialTransparency,
          titleSpacing: titleSpacing,
          leadingWidth: leadingWidth,
          centerTitle: centerTitle,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          leading: leading,
          title: title,
          actions: [
            if (actions != null) ...actions,
          ],
          bottom: bottom,
        );
}
