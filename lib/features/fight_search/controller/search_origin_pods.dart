import 'package:flutter_fly/features/fight_search/controller/all_flights_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchOriginPod = FutureProvider.autoDispose.family<List<String>, String>(
  (ref, query) async {
    final flightsmodel = await ref.watch(allFightsPod.future);
    final flights = flightsmodel.flights
        .where((element) => element.origin.contains(query))
        .toList();

    return flights.map((e) => e.origin).toSet().toList();
  },
  name: 'searchOriginPod',
);
