import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'app_routes/home_routes.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class OMRouterManager {
  OMRouterManager._privateConstructor();

  static final OMRouterManager shared = OMRouterManager._privateConstructor();

  final GoRouter router = GoRouter(
    initialLocation: omAppRoutes.rootPath,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    // refreshListenable: AppManager.shared.userMe,
    routes: [
      OMHomeRoute.home.goRoute,
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (state.fullPath == OMHomeRoute.home.fullPath || state.fullPath == omAppRoutes.rootPath || state.fullPath == "") {
        return OMHomeRoute.home.fullPath;
      }
      return null;
    },
    errorBuilder: (BuildContext context, GoRouterState state) {
      context.go(OMHomeRoute.home.fullPath);
      return const SizedBox();
    },
  );
}
