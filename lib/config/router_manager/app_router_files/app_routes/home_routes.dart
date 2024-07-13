import 'package:flutter/material.dart';
import 'package:gbm_services/gbm_services.dart';
import 'package:go_router/go_router.dart';
import 'package:omen_tattoo_studio/data/sketches_list.dart';
import 'package:omen_tattoo_studio/data/tattoos_list.dart';

import '../../../../screens/about_widget/about_widget.dart';
import '../../../../screens/advices_widget/advices_widget.dart';
import '../../../../screens/contacts_widget/contacts_widget.dart';
import '../../../../screens/home_widget/home_widget.dart';
import '../../../../screens/portfolio_widget/image_details_widget.dart';
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
  details,
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
      case details:
        return name;
    }
  }

  @override
  String get localization {
    switch (this) {
      case home:
        return "OMEN Tattoo Studio";
      case portfolio:
        return "Portfolio";
      case advices:
        return "Savjeti";
      case about:
        return "About";
      case contacts:
        return "Kontakti";
      case sketches:
        return "Skice";
      case tattoos:
        return "Tattoo";
      case details:
        return "Detalji";
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
      case sketches:
        return [details];
      case tattoos:
        return [details];
      case advices:
      case about:
      case contacts:
      case details:
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
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMHomeWidget(),
              ),
            );
          case portfolio:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMPortfolioWidget(),
              ),
            );
          case sketches:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMImageListWidget(isTattoo: false),
              ),
            );
          case tattoos:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMImageListWidget(isTattoo: true),
              ),
            );
          case details:
            Map queryParams = state.uri.queryParameters;

            if (queryParams.containsKey("id") &&
                int.tryParse(queryParams["id"]) != null &&
                queryParams.containsKey("type") &&
                ((queryParams["type"] == "sketches" &&
                        sketchesList.firstWhereOrNull(
                              (p0) {
                                return p0.id == int.parse(queryParams["id"]);
                              },
                            ) !=
                            null) ||
                    (queryParams["type"] == "tattoos" &&
                        tattoosList.firstWhereOrNull(
                              (p0) {
                                return p0.id == int.parse(queryParams["id"]);
                              },
                            ) !=
                            null))) {
              return NoTransitionPage(
                child: Title(
                  title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                  color: Theme.of(context).primaryColor,
                  child: OMImageDetailsWidget(
                    type: queryParams["type"],
                    id: int.parse(queryParams["id"]!),
                  ),
                ),
              );
            } else {
              context.go(OMHomeRoute.portfolio.fullPath);
              return NoTransitionPage(
                child: Title(
                  title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                  color: Theme.of(context).primaryColor,
                  child: const SizedBox(),
                ),
              );
            }

          case advices:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMAdvicesWidget(),
              ),
            );
          case about:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const OMAboutWidget(),
              ),
            );
          case contacts:
            return NoTransitionPage(
              child: Title(
                title: omAppRoutes.browserTitleFromFullPath(state.fullPath ?? omAppRoutes.rootPath) ?? '',
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
