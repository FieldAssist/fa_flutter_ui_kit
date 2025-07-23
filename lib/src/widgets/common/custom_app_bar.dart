import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/colors.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    Widget? leading,
    required Widget title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true,
    IconThemeData? iconTheme,
    bool? centerTitle,
    double? leadingWidth,
  }) : super(
          elevation: 0,
          toolbarHeight: 60,
          automaticallyImplyLeading: automaticallyImplyLeading,
          iconTheme: iconTheme,
          titleSpacing: 8,
          leadingWidth: leadingWidth,
          centerTitle: centerTitle,
          backgroundColor: AppColors.kBlueColor.shade25,
          leading: leading,
          title: title,
          actions: [
            if (actions != null) ...actions,
          ],
          bottom: bottom,
        );
}
