// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_fly/features/book_flight/view/book_flight_page.dart'
    deferred as _i1;
import 'package:flutter_fly/features/confirm_tkt_booking/view/confirmed_tkt_booking_page.dart'
    deferred as _i2;
import 'package:flutter_fly/features/counter/view/counter_page.dart'
    deferred as _i3;
import 'package:flutter_fly/features/fight_search/model/flights_model.dart'
    as _i8;
import 'package:flutter_fly/features/fight_search/model/search_flight_request.dart'
    as _i9;
import 'package:flutter_fly/features/fight_search/view/flight_search_page.dart'
    deferred as _i5;
import 'package:flutter_fly/features/flight_search_list/view/flight_search_list_page.dart'
    deferred as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BookFlightRoute.name: (routeData) {
      final args = routeData.argsAs<BookFlightRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.BookFlightPage(
            key: args.key,
            flight: args.flight,
          ),
        ),
      );
    },
    ConfirmedTktBookingRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmedTktBookingRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.ConfirmedTktBookingPage(
            key: args.key,
            flight: args.flight,
            adults: args.adults,
            totalprice: args.totalprice,
            dateTime: args.dateTime,
          ),
        ),
      );
    },
    CounterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.CounterPage(),
        ),
      );
    },
    FlightSearchListRoute.name: (routeData) {
      final args = routeData.argsAs<FlightSearchListRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.FlightSearchListPage(
            key: args.key,
            searchFlightRequest: args.searchFlightRequest,
          ),
        ),
      );
    },
    FlightSearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.FlightSearchPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BookFlightPage]
class BookFlightRoute extends _i6.PageRouteInfo<BookFlightRouteArgs> {
  BookFlightRoute({
    _i7.Key? key,
    required _i8.Flight flight,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          BookFlightRoute.name,
          args: BookFlightRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'BookFlightRoute';

  static const _i6.PageInfo<BookFlightRouteArgs> page =
      _i6.PageInfo<BookFlightRouteArgs>(name);
}

class BookFlightRouteArgs {
  const BookFlightRouteArgs({
    this.key,
    required this.flight,
  });

  final _i7.Key? key;

  final _i8.Flight flight;

  @override
  String toString() {
    return 'BookFlightRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [_i2.ConfirmedTktBookingPage]
class ConfirmedTktBookingRoute
    extends _i6.PageRouteInfo<ConfirmedTktBookingRouteArgs> {
  ConfirmedTktBookingRoute({
    _i7.Key? key,
    required _i8.Flight flight,
    required int adults,
    required double totalprice,
    required DateTime dateTime,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ConfirmedTktBookingRoute.name,
          args: ConfirmedTktBookingRouteArgs(
            key: key,
            flight: flight,
            adults: adults,
            totalprice: totalprice,
            dateTime: dateTime,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmedTktBookingRoute';

  static const _i6.PageInfo<ConfirmedTktBookingRouteArgs> page =
      _i6.PageInfo<ConfirmedTktBookingRouteArgs>(name);
}

class ConfirmedTktBookingRouteArgs {
  const ConfirmedTktBookingRouteArgs({
    this.key,
    required this.flight,
    required this.adults,
    required this.totalprice,
    required this.dateTime,
  });

  final _i7.Key? key;

  final _i8.Flight flight;

  final int adults;

  final double totalprice;

  final DateTime dateTime;

  @override
  String toString() {
    return 'ConfirmedTktBookingRouteArgs{key: $key, flight: $flight, adults: $adults, totalprice: $totalprice, dateTime: $dateTime}';
  }
}

/// generated route for
/// [_i3.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FlightSearchListPage]
class FlightSearchListRoute
    extends _i6.PageRouteInfo<FlightSearchListRouteArgs> {
  FlightSearchListRoute({
    _i7.Key? key,
    required _i9.SearchFlightRequest searchFlightRequest,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          FlightSearchListRoute.name,
          args: FlightSearchListRouteArgs(
            key: key,
            searchFlightRequest: searchFlightRequest,
          ),
          initialChildren: children,
        );

  static const String name = 'FlightSearchListRoute';

  static const _i6.PageInfo<FlightSearchListRouteArgs> page =
      _i6.PageInfo<FlightSearchListRouteArgs>(name);
}

class FlightSearchListRouteArgs {
  const FlightSearchListRouteArgs({
    this.key,
    required this.searchFlightRequest,
  });

  final _i7.Key? key;

  final _i9.SearchFlightRequest searchFlightRequest;

  @override
  String toString() {
    return 'FlightSearchListRouteArgs{key: $key, searchFlightRequest: $searchFlightRequest}';
  }
}

/// generated route for
/// [_i5.FlightSearchPage]
class FlightSearchRoute extends _i6.PageRouteInfo<void> {
  const FlightSearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FlightSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightSearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
