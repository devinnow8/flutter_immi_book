import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/404/page_not_found.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';

abstract class Routes {
  static const home = '/';
  static const e1 = '/e1';
  static const e2 = '/e2';
  static const e404 = '/404';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.e404,
      page: () => const PageNotFound(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const MyHomePage(title: 'Under Contruction'),
    ),
    GetPage(
      name: Routes.e1,
      page: () => Container(),
    ),
    GetPage(
      name: Routes.e2,
      page: () => Container(),
    ),
  ];
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.home)!.currentPage!],
    );
  }
}

class AppInformationParser extends RouteInformationParser<GetNavConfig> {
  /// [initialRoute] => [/]
  AppInformationParser({
    String? initialRoute,
  })  : initialRoute = initialRoute ?? '/',
        super();

  /// Initial route
  /// default '/'
  final String initialRoute;

  @override
  Future<GetNavConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    String? location = routeInformation.location; // => [/]
    if (location == '/') {
      if (!Get.routeTree.routes.any((e) => e.name == '/')) {
        location = initialRoute;
      }
    }

    // if (!Get.routeTree.routes.any((e) => false)) {
    //   location = AppRoutes.notFound;
    // }

    final matchResult = Get.routeTree.matchRoute(location ?? initialRoute);
    String? matchResultLocation = matchResult.route?.name;
    if (kDebugMode) {
      print("App Information Parser location : $location");
      print("Match Result Parser location : ${matchResult.route?.name}");
    }

    if (matchResultLocation != location) {
      location = Routes.e404;
    } else {
      location = matchResultLocation;
    }

    final result = Get.routeTree.matchRoute(location ?? initialRoute);

    return SynchronousFuture(
      GetNavConfig(
        currentTreeBranch: result.treeBranch,
        location: location,
        state: routeInformation.state,
      ),
    );
  }

  @override
  RouteInformation? restoreRouteInformation(GetNavConfig configuration) {
    return RouteInformation(
      location: configuration.location,
      state: configuration.state,
    );
  }
}
