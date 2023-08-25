import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

final delayBookerPod = FutureProvider.autoDispose<bool>((ref) async {
  await Future.delayed(10.seconds);
  return true;
});
