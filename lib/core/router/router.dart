import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fly/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: FlightSearchRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: FlightSearchListRoute.page,
      path: '/searchList',
    ),
    CustomRoute(
      page: BookFlightRoute.page,
      path: '/book-flight',
      customRouteBuilder:
          <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return DialogRoute(
          barrierColor: Colors.transparent,
          context: context,
          // this is important
          settings: page,
          builder: (_) => child,
        );
      },
    ),
    AutoRoute(
      page: ConfirmedTktBookingRoute.page,
      path: '/confirmTKT',
    ),
  ];
}
