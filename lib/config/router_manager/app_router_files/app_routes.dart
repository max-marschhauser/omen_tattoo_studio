import '../common_router_files/element_routes.dart';
import '../common_router_files/main_route.dart';
import 'app_routes/home_routes.dart';

OMAppRoutes omAppRoutes = OMAppRoutes();

class OMAppRoutes with MainWBRoutes {
  @override
  final String rootPath = "/";

  @override
  List<MainWBRoute> get routes => [
        ...OMHomeRoute.values.map((e) => e.erRoute),
      ];
}

OMElementsAppRoutes elementsAppRoutes = OMElementsAppRoutes();

class OMElementsAppRoutes with MainGRRoutes {
  @override
  String get rootPath => omAppRoutes.rootPath;

  @override
  List<MainGRRoute> get routes => omAppRoutes.routes.map((e) => e as MainGRRoute).toList();
}
