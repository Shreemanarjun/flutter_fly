import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fly/core/router/router.gr.dart';
import 'package:flutter_fly/features/book_flight/controller/current_adults.dart';
import 'package:flutter_fly/features/book_flight/controller/current_ticket_price.dart';
import 'package:flutter_fly/features/book_flight/view/widgets/custom_stepper.dart';
import 'package:flutter_fly/features/book_flight/view/widgets/total_price_text.dart';
import 'package:flutter_fly/features/fight_search/model/flights_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class BookFlightPage extends StatelessWidget {
  final Flight flight;
  const BookFlightPage({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: "Booking Info".text.isIntrinsic.makeCentered(),
        content: <Widget>[
          "Adults".text.isIntrinsic.xl.make(),
          Consumer(
            builder: (context, ref, child) {
              return CustomStepper(
                initialValue: 1,
                maximum: flight.seatsAvailable,
                onChange: (step) {
                  ref.read(currentAdultsPod.notifier).update((state) => step);
                },
              );
            },
          ).flexible(),
          TotalPriceText(
            price: flight.price.toDouble(),
          ).py4().flexible(),
          "Do you want to confirm the booking? ".text.isIntrinsic.make()
        ].vStack(
          axisSize: MainAxisSize.min,
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  final adults = ref.read(currentAdultsPod);
                  final totalprice =
                      ref.read(currentTotalProvider(flight.price.toDouble()));
                  context.router.replace(
                    ConfirmedTktBookingRoute(
                      adults: adults,
                      flight: flight,
                      totalprice: totalprice,
                      dateTime: DateTime.now(),
                    ),
                  );
                },
                child: "Yes".text.green300.semiBold.isIntrinsic.make(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.router.back();
            },
            child: "No".text.green300.semiBold.isIntrinsic.make(),
          )
        ],
      ),
    );
  }
}
