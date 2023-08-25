import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fly/const/resource.dart';
import 'package:flutter_fly/features/confirm_tkt_booking/controller/delay_booker_pod.dart';
import 'package:flutter_fly/features/confirm_tkt_booking/view/widget/ticket_data_widget.dart';
import 'package:flutter_fly/features/fight_search/model/flights_model.dart';
import 'package:flutter_fly/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class ConfirmedTktBookingPage extends StatelessWidget {
  final Flight flight;
  final int adults;
  final double totalprice;
  final DateTime dateTime;
  const ConfirmedTktBookingPage(
      {Key? key,
      required this.flight,
      required this.adults,
      required this.totalprice,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final delaybookerAsync = ref.watch(delayBookerPod);
          return delaybookerAsync.easyWhen(
            data: (data) {
              return <Widget>[
                "Your flight ticket got confirmed"
                    .text
                    .xl2
                    .bold
                    .white
                    .make()
                    .pOnly(top: 50),
                TicketWidget(
                  width: context.screenWidth * 0.8,
                  height: 500,
                  isCornerRounded: true,
                  padding: const EdgeInsets.all(20),
                  child: TicketData(
                    flight: flight,
                    adults: adults,
                    dateTime: dateTime,
                    totalprice: totalprice,
                  ),
                ).pOnly(top: 50),
              ]
                  .vStack(
                    crossAlignment: CrossAxisAlignment.center,
                  )
                  .centered()
                  .onTap(() {
                ref.invalidate(delayBookerPod);
              });
            },
            loadingWidget: () => LottieBuilder.asset(
              R.ASSETS_ANIM_ANIMATION_LLQJVNGP_JSON,
            ).hHalf(context),
            skipLoadingOnRefresh: false,
          );
        },
      ).scrollVertical().safeArea(),
    );
  }
}
