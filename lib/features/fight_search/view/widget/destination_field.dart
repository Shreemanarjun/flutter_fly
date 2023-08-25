import 'package:flutter/material.dart';
import 'package:flutter_fly/features/fight_search/const/flight_search_form_keys.dart';
import 'package:flutter_fly/features/fight_search/controller/search_destinanation_pod.dart';
import 'package:flutter_fly/features/fight_search/controller/selected_flight_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

class DestinationField extends ConsumerWidget {
  const DestinationField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderTypeAhead<String>(
      name: FlightSearchFormKeys.to,
      suggestionsCallback: (pattern) async {
        final destinationflights =
            await ref.read(searchDestinationPod(pattern.toLowerCase()).future);
        final selectedOriginflight = ref.read(selectedOriginPod);
        if (selectedOriginflight != null) {
          destinationflights.removeWhere(
            (element) =>
                element.toLowerCase() == selectedOriginflight.toLowerCase(),
          );
        }
        return destinationflights;
      },
      itemBuilder: (context, origin) {
        return ListTile(
          title: origin.text.make(),
        );
      },
      decoration: const InputDecoration(
        hintText: "To",
        labelText: "Select Destination",
      ),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (destination) {
        ref
            .read(selectedDestinationPod.notifier)
            .update((state) => destination);
      },
    );
  }
}
