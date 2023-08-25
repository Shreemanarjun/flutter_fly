import 'package:flutter/material.dart';
import 'package:flutter_fly/features/book_flight/controller/current_ticket_price.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalPriceText extends ConsumerWidget {
  final double price;
  const TotalPriceText({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(currentTotalProvider(price));
    return "Total: \$ $totalPrice".text.xl.isIntrinsic.make();
  }
}
