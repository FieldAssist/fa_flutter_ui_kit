import 'package:auto_route/auto_route.dart';

import 'ui_common_router.gr.dart';

/// Never mounted. auto_route only generates route classes for `@RoutePage`s
/// that a router config in the same package lists, so this one exists to
/// emit them into `ui_common_router.gr.dart`.
@AutoRouterConfig(replaceInRouteName: r'$,Route')
class UiCommonRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => uiCommonRoutes;
}

/// This package's routes, spread into the host's router.
List<AutoRoute> get uiCommonRoutes => [
      AutoRoute(page: CameraImagePageRoute.page),
      AutoRoute(page: ImageReviewPageRoute.page),
    ];
