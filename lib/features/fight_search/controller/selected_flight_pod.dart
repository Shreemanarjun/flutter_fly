import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedOriginPod = StateProvider.autoDispose<String?>(
  (ref) {
    return null;
  },
  name: 'selectedOriginPod',
);
final selectedDestinationPod = StateProvider.autoDispose<String?>(
  (ref) {
    return null;
  },
  name: 'selectedDestinationPod',
);
