import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentAdultsPod = StateProvider.autoDispose<int>((ref) {
  return 1;
});
