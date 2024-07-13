import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../screens/about_widget/about_widget.dart';
import '../../../../screens/advices_widget/advices_widget.dart';
import '../../../../screens/contacts_widget/contacts_widget.dart';
import '../../../../screens/home_widget/home_widget.dart';
import '../../../../screens/portfolio_widget/image_list_widget.dart';
import '../../../../screens/portfolio_widget/portfolio_widget.dart';
import '../../common_router_files/element_routes.dart';
import '../app_route.dart';
import '../app_routes.dart';

enum OMHomeRoute with MainGRRouteSegment {
  home,
  portfolio,
  advices,
  about,
  contacts,
  sketches,
  tattoos,
  ;

  @override
  String get path {
    switch (this) {
      case home:
      case portfolio:
      case advices:
      case about:
      case contacts:
      case sketches:
      case tattoos:
        return name;
    }
  }

  @override
  String get localization {
    switch (this) {
      case home:
      case portfolio:
      case advices:
      case about:
      case contacts:
      case sketches:
      case tattoos:
        return name;
    }
  }

  @override
  List<OMHomeRoute> get subRoutes {
    switch (this) {
      case home:
        return [
          portfolio,
          advices,
          about,
          contacts,
        ];
      case portfolio:
        return [sketches, tattoos];
      case advices:
      case about:
      case contacts:
      case sketches:
      case tattoos:
        return [];
    }
  }

  List<MainGRRouteSegment> get rootRoutes => [
        home,
      ];

  String get goRoutePath => rootRoutes.contains(this) ? "/$path" : path;

  @override
  String get fullPath => getFullPath(OMHomeRoute.values);

  OMRoute get erRoute => OMRoute(
        displayName: localization,
        fullPath: fullPath,
        segment: path,
      );

  @override
  GoRoute get goRoute {
    return GoRoute(
      path: goRoutePath,
      pageBuilder: (context, state) {
        switch (this) {
          case home:
            return NoTransitionPage(
              child: Title(
                title: "Home",
                color: Theme.of(context).primaryColor,
                child: const OMHomeWidget(),
              ),
            );
          case portfolio:
            return NoTransitionPage(
              child: Title(
                title: "Portfolio",
                color: Theme.of(context).primaryColor,
                child: const OMPortfolioWidget(),
              ),
            );
          case sketches:
            return NoTransitionPage(
              child: Title(
                title: "Skice",
                color: Theme.of(context).primaryColor,
                child: const OMImageListWidget(isTattoo: false),
              ),
            );
          case tattoos:
            return NoTransitionPage(
              child: Title(
                title: "Tattoos",
                color: Theme.of(context).primaryColor,
                child: const OMImageListWidget(isTattoo: true),
              ),
            );
          case advices:
            return NoTransitionPage(
              child: Title(
                title: "Savjeti",
                color: Theme.of(context).primaryColor,
                child: const OMAdvicesWidget(),
              ),
            );
          case about:
            return NoTransitionPage(
              child: Title(
                title: "Umjetnica",
                color: Theme.of(context).primaryColor,
                child: const OMAboutWidget(),
              ),
            );
          case contacts:
            return NoTransitionPage(
              child: Title(
                title: "Kontakti",
                color: Theme.of(context).primaryColor,
                child: const OMContactsWidget(),
              ),
            );
        }
      },
      routes: subRoutes.map((e) => e.goRoute).toList(),
    );
  }
}
