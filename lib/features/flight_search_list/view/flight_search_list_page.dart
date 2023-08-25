import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fly/const/resource.dart';
import 'package:flutter_fly/core/router/router.gr.dart';
import 'package:flutter_fly/features/fight_search/model/search_flight_request.dart';
import 'package:flutter_fly/features/flight_search_list/controller/search_list_pod.dart';
import 'package:flutter_fly/shared/extension/date_extensions.dart';
import 'package:flutter_fly/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class FlightSearchListPage extends StatelessWidget {
  final SearchFlightRequest searchFlightRequest;
  const FlightSearchListPage({Key? key, required this.searchFlightRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final searchedflightsAsync =
              ref.watch(searchFlightListPod(searchFlightRequest));
          return searchedflightsAsync.easyWhen(
            data: (flights) {
              return flights.isEmpty
                  ? "No Flights are available"
                      .text
                      .xl2
                      .lime200
                      .bold
                      .makeCentered()
                  : <Widget>[
                      "${flights.length} ${flights.length > 1 ? "flights" : "flight"} found"
                          .text
                          .xl2
                          .make(),
                      <Widget>[
                        "Depature on  ${searchFlightRequest.date.toString().dayMonthNameYearWithTime()}"
                            .text
                            .lg
                            .lime400
                            .make(),
                      ].vStack(),
                      ListView.separated(
                        padding: const EdgeInsets.only(top: 40),
                        itemCount: flights.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final flight = flights[index];
                          return ListTile(
                            tileColor: context.colors.surfaceVariant,
                            titleAlignment: ListTileTitleAlignment.threeLine,
                            leading: <Widget>[
                              flight.airline.text.medium.xl.make(),
                              flight.flightNumber.text.lg.make(),
                            ].vStack(
                              crossAlignment: CrossAxisAlignment.start,
                              axisSize: MainAxisSize.min,
                            ),
                            title: <Widget>[
                              "${flight.origin} to ${flight.destination}"
                                  .text
                                  .make(),
                            ].vStack(
                              alignment: MainAxisAlignment.start,
                              crossAlignment: CrossAxisAlignment.start,
                              axisSize: MainAxisSize.min,
                            ),
                            subtitle: <Widget>[
                              "Arrival ${flight.arrivalDate.dayMonthNameYearWithTime()}"
                                  .text
                                  .make(),
                              "Duration ${flight.duration}".text.make(),
                              RichText(
                                text: TextSpan(
                                  text: "Price :",
                                  style: context.textTheme.titleSmall,
                                  children: [
                                    " \$${flight.price}"
                                        .textSpan
                                        .green400
                                        .make()
                                  ],
                                ),
                              )
                            ].vStack(
                              alignment: MainAxisAlignment.start,
                              crossAlignment: CrossAxisAlignment.start,
                              axisSize: MainAxisSize.min,
                            ),
                            trailing: <Widget>[
                              if (flight.seatsAvailable > 0)
                                ElevatedButton(
                                  onPressed: () {
                                    //Book flight
                                    context.navigateTo(
                                        BookFlightRoute(flight: flight));
                                  },
                                  child: "Book".text.make(),
                                )
                            ].vStack(),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ).expand()
                    ].vStack();
            },
            loadingWidget: () => LottieBuilder.asset(
              R.ASSETS_ANIM_ANIMATION_LLQDRUPL_JSON,
            ).centered(),
          );
        },
      ).safeArea(),
    );
  }
}
