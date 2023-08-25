import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomStepper extends StatefulWidget {
  final int initialValue;
  final int maximum;
  final void Function(int step) onChange;
  const CustomStepper(
      {Key? key,
      required this.initialValue,
      required this.maximum,
      required this.onChange})
      : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController =
        TextEditingController(text: widget.initialValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
            side: const BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
        onPressed: () {
          final cvalue = int.parse(textEditingController.text);
          textEditingController.value =
              TextEditingValue(text: (cvalue + 1).toString());
          widget.onChange(int.parse(textEditingController.text));
        },
        icon: const Icon(Icons.add),
      ).px4(),
      TextFormField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.min(1),
          FormBuilderValidators.max(widget.maximum),
        ]),
        onChanged: (value) {
          widget.onChange(int.parse(value));
        },
      ).py12().flexible(),
      IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
            side: const BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
        onPressed: () {
          final cvalue = int.parse(textEditingController.text);
          if (cvalue != 1) {
            textEditingController.value =
                TextEditingValue(text: (cvalue - 1).toString());
            widget.onChange(int.parse(textEditingController.text));
          }
        },
        icon: const Icon(Icons.remove),
      ).px4(),
    ].hStack();
  }
}
