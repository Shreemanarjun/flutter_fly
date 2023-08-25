import 'package:flutter/material.dart';
import 'package:flutter_fly/features/fight_search/const/flight_search_form_keys.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: FlightSearchFormKeys.date,
      initialDatePickerMode: DatePickerMode.day,
      decoration: const InputDecoration(
        hintText: "Date",
        labelText: "Select Depature Date",
      ),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      inputType: InputType.date,
      format: DateFormat('dd MMM yyyy'),
      firstDate: DateTime.now(),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
