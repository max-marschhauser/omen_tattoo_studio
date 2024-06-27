import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// reinit upRoutes on language change
/// mixin APPRoutes implements GRRoutes {
///List of all GRRoute get params in APPRoutes class

/// List<GRRoute> get upRoutes => [
/// pageOne,
/// pageTwo
/// ];
/// MARK: - ModuleOne
///   late final GRRoute pageOne = APPRoutes.pageOne(rootPath);
///   late final GRRoute pageTwo = APPRoutes.pageTwo(rootPath);
///
/// abstract class APPRoutes {
///   static GRRoute pageOne(String rootPath) => APPRouteDetails(
///         segment: UPOrgRouteSegments.organization.path,
///         displayName: i18Nup.state.pageOneLocalization,
///         fullPath: "$rootPath${AppRouteSegments.pageOne.path}",
///       );
///
/// To set title in browser tab override browserTitle in GRRoute
/// Title(
///   title: upAppRoutes.browserTitleFromFullPath(state.fullPath ?? upAppRoutes.rootPath) ?? '',
///   color: Theme.of(context).primaryColor.withAlpha(255),
///   child: ClipRect(child: child),
///);
abstract mixin class MainGRRoutes {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
  final GlobalKey<NavigatorState> sideMenuNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sideMenuNavigatorKey');

  String get rootPath;

  //List of all UIRoute get params in UPRoutes class
  List<MainGRRoute> get routes;

  // List<String> get idParams;

  String? browserTitleFromFullPath(String fullPath) {
    return routes.firstWhereOrNull((element) => element.fullPath == fullPath)?.browserTitle;
  }
}

abstract mixin class MainGRRoute {
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

class MainGRBreadcrumb {
  String? displayName;
  final String fullPath;
  final bool isLink;
  final Map<String, String>? idSegment;

  MainGRBreadcrumb({
    required this.fullPath,
    this.isLink = true,
    this.displayName,
    this.idSegment,
  });
}

/// enum AppRouteSegments implements GRRouteSegments {
///   pageOne,
///   pageTwo,
///
///     String get localization {
///     switch (this) {
///       case pageOne:
///         return i18Nup.state.pageOneLocalization;
///           @override
///
/// Path is used for GoRouter
///   String get path {
///     switch (this) {
///       case pageOne:
///         return "page-one";
///       case pageTwo:
///         return ":${UPIdParams.idOfficer.name}";
abstract mixin class MainGRRouteSegment {
  String get path;

  String get localization;

  ///Do not override this method in enum
  ///from enum use get fullPath => getFullPath(CurrentRouteSegment.values);
  ///if routePath is provided it will be used instead of GRAppManager.shared.rootPath
  ///for example: /new-root-path/ the default rootPath is /
  @nonVirtual
  String getFullPath(List<MainGRRouteSegment> values, {String? routePath}) {
    //find parent route for this segment
    for (final segment in values) {
      if (segment.subRoutes.contains(this)) {
        return "${segment.getFullPath(values)}/$path";
      }
    }
    final root = routePath ?? "/";
    return root + path;
  }

  /// set subRoutes for this segment, its used to determent fullPath for example:
  ///   @override
  ///   List<ExampleSegments> get subRoutes {
  ///     switch (this) {
  ///       case caseManagement:
  ///         return [all, newShipment, mine, single];
  ///       case single:
  ///         return [details, edit, access, myActs, allActs, activities];
  ///       case details:
  ///         return [add, act];
  ///       default:
  ///         return [];
  ///     }
  ///   }
  List<MainGRRouteSegment> get subRoutes;

  String get fullPath;

  GoRoute get goRoute;
}

extension _IterableEx<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
