import 'package:flutter_fly/features/book_flight/controller/current_adults.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTotalProvider =
    Provider.autoDispose.family<double, double>((ref, tktprice) {
  final adults = ref.watch(currentAdultsPod);
  return adults * tktprice;
});
