import 'package:collection/collection.dart';

abstract mixin class MainWBRoute {
  /// route for GoRouter
  String get segment;

  /// full location from GoRouter state.fullPath
  String get fullPath;

  /// displayed in browser tab
  String get browserTitle => displayName;

  /// displayed in application header
  String get displayName;

  bool get permission;

  bool get showBreadcrumb;

  String fullPathWithParamValues(List<String> values) {
    final RegExp placeholderRegex = RegExp(r':\w+');

    String replacedPath = fullPath.replaceAllMapped(placeholderRegex, (match) => values.removeAt(0));

    return replacedPath;
  }
}

abstract mixin class MainWBRoutes {
  String get rootPath;

  List<MainWBRoute> get routes;

  String? browserTitleFromFullPath(String fullPath) {
    return routes.firstWhereOrNull((element) => element.fullPath == fullPath)?.browserTitle;
  }
}
