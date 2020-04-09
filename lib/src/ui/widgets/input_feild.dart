import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Key key;
  final String value;
  final String attr;
  final String label;
  final String error;
  final bool enabled;
  final Function onChanged;
  final Function validator;
  final id = InputDecoration(
    counter: Text("a"),
    counterText: "counter",
  );
  InputField({
    this.key,
    this.value,
    this.label,
    this.attr,
    this.error,
    this.validator,
    this.enabled = true,
    this.onChanged,

  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: this.value),
      decoration: InputDecoration(
        // labelText: this.label,
        hintText: this.label,
        errorText: this.error,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        border: Theme.of(context).inputDecorationTheme.border,

      ),
    );
  }
}
