import 'package:flutter_fly/features/fight_search/controller/all_flights_pod.dart';
import 'package:flutter_fly/features/fight_search/model/flights_model.dart';
import 'package:flutter_fly/features/fight_search/model/search_flight_request.dart';
import 'package:flutter_fly/shared/extension/date_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

final searchFlightListPod = FutureProvider.autoDispose
    .family<List<Flight>, SearchFlightRequest>((ref, request) async {
  await Future.delayed(2.seconds);
  final allFlights = await ref.watch(allFightsPod.future);
  final searchedflights = allFlights.flights.where((flight) =>
      flight.origin == request.origin &&
      flight.destination == request.destination &&
      DateFormat('yyyy-MM-dd').parse(flight.departureDate).isSameDate(
            request.date,
          ));
  return searchedflights.toList();
});
