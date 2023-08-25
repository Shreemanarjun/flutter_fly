import 'package:flutter/material.dart';
import 'package:flutter_fly/features/fight_search/const/flight_search_form_keys.dart';
import 'package:flutter_fly/features/fight_search/controller/search_origin_pods.dart';
import 'package:flutter_fly/features/fight_search/controller/selected_flight_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

class OriginField extends ConsumerWidget {
  const OriginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderTypeAhead<String>(
      name: FlightSearchFormKeys.from,
      suggestionsCallback: (pattern) async {
        final originFlights =
            await ref.read(searchOriginPod(pattern.toLowerCase()).future);
        final selectedDestinationflight = ref.read(selectedDestinationPod);
        if (selectedDestinationflight != null) {
          originFlights.removeWhere(
            (element) =>
                element.toLowerCase() ==
                selectedDestinationflight.toLowerCase(),
          );
        }
        return originFlights;
      },
      itemBuilder: (context, origin) {
        return ListTile(
          title: origin.text.make(),
        );
      },
      decoration: const InputDecoration(
        hintText: "From",
        labelText: "Select Origin",
      ),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (flight) {
        ref.read(selectedOriginPod.notifier).update((state) => flight);
      },
    );
  }
}
