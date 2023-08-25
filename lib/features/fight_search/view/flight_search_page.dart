import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fly/core/router/router.gr.dart';
import 'package:flutter_fly/features/fight_search/const/flight_search_form_keys.dart';
import 'package:flutter_fly/features/fight_search/model/search_flight_request.dart';
import 'package:flutter_fly/features/fight_search/view/widget/date_field.dart';
import 'package:flutter_fly/features/fight_search/view/widget/destination_field.dart';
import 'package:flutter_fly/features/fight_search/view/widget/origin_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({Key? key}) : super(key: key);

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void searchFlights() async {
    if (_formKey.currentState?.validate() ?? false) {
      final fields = _formKey.currentState?.fields;
      final origin = fields?[FlightSearchFormKeys.from]?.value as String;
      final destination = fields?[FlightSearchFormKeys.to]?.value as String;
      final date = fields?[FlightSearchFormKeys.date]?.value as DateTime;
      final request = SearchFlightRequest(
          origin: origin, destination: destination, date: date);
      context.navigateTo(
        FlightSearchListRoute(
          searchFlightRequest: request,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Book a flight"
            .text
            .white
            .xl4
            .bold
            .textStyle(GoogleFonts.getFont('Patua One'))
            .make(),
      ),
      body: FormBuilder(
        key: _formKey,
        child: <Widget>[
          const OriginField(),
          const DestinationField().pOnly(top: 12),
          const DateField().pOnly(top: 12),
          ElevatedButton(
            onPressed: searchFlights,
            child: "Search Flights".text.make(),
          ).pOnly(top: 12),
        ]
            .vStack(
              crossAlignment: CrossAxisAlignment.center,
            )
            .p20()
            .centered()
            .scrollVertical()
            .safeArea(),
      ),
    );
  }
}
