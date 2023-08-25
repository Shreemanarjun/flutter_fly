import 'package:flutter/services.dart';
import 'package:flutter_fly/const/resource.dart';
import 'package:flutter_fly/features/fight_search/model/flights_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allFightsPod = FutureProvider.autoDispose<FlightsModel>(
  (ref) async {
    final data = await rootBundle.loadString(R.ASSETS_JSON_FLIGHT_DETAILS_JSON);
    return FlightsModel.fromJson(data);
  },
  name: 'allFightsPod',
);
