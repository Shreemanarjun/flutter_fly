import 'package:flutter/material.dart';
import 'package:flutter_fly/features/confirm_tkt_booking/view/widget/ticket_details.dart';
import 'package:flutter_fly/features/fight_search/model/flights_model.dart';
import 'package:flutter_fly/shared/extension/date_extensions.dart';

class TicketData extends StatelessWidget {
  final Flight flight;
  final int adults;
  final double totalprice;
  final DateTime dateTime;
  const TicketData({
    Key? key,
    required this.flight,
    required this.adults,
    required this.totalprice,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'Business Class',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  flight.origin,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.flight_takeoff,
                    color: Colors.pink,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    flight.destination,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Flight Ticket',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 30.0),
                child: TicketDetailsWidget(
                    firstTitle: 'Passengers',
                    firstDesc:
                        'Shreeman Arjun Sahu \n${adults > 1 ? "& ${adults - 1} others" : ""}',
                    secondTitle: 'Date',
                    secondDesc: dateTime.toString().dayMonthNameYear()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                child: TicketDetailsWidget(
                  firstTitle: 'Flight',
                  firstDesc: flight.flightNumber,
                  secondTitle: 'Airleine',
                  secondDesc: flight.airline,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12.0, right: 53.0),
                child: TicketDetailsWidget(
                    firstTitle: 'Class',
                    firstDesc: 'Business',
                    secondTitle: 'Seat',
                    secondDesc: '21B'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: TicketDetailsWidget(
                  firstTitle: 'Adults',
                  firstDesc: adults.toString(),
                  secondTitle: 'Total Price',
                  secondDesc: totalprice.toString(),
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
        //   child: Container(
        //     width: 250.0,
        //     height: 60.0,
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/barcode.png'),
        //             fit: BoxFit.cover)),
        //   ),
        // ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Text(
            '0000 +9230 2884 5163',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
