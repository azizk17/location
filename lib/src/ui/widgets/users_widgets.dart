import 'package:location/src/locale.dart';
import 'package:location/src/ui/widgets/input_feild.dart';
import 'package:flutter/material.dart';

@deprecated
class EmailField extends InputField {
  EmailField({
    Key key,
    String value,
    String attr,
    String label,
    String error,
    bool enabled = true,
    Function onChanged,
    Function validator,
  }) : super(
          key: key,
          value: value,
          error: error,
          label: label,
          attr: attr,
          enabled: enabled,
          onChanged: onChanged,
          validator: validator,
        );
}

class EmailFormField extends StatelessWidget {
  final Key key;
  final String initialValue;
  final bool autofocus;
  final TextEditingController controller;
  EmailFormField({
    this.key,
    this.initialValue,
    this.autofocus = false,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: this.key,
      decoration: InputDecoration(hintText: AppLocalizations.of(context).email),
      autofocus: this.autofocus,
      initialValue: this.initialValue,
      controller: this.controller,
      validator: (val) => _validator(context, val),
    );
  }

  String _validator(BuildContext context, String val) {
    if (val.length > 4) {
      return "EMAIL IS NOT";
    }
  }
}

class NameInput extends StatelessWidget {
  final Key key;
  final String initialValue;
  final bool autofocus;
  final TextEditingController controller;
  NameInput({
    this.key,
    this.initialValue,
    this.autofocus = false,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: this.key,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).name,
      ),
      autofocus: this.autofocus,
      initialValue: this.initialValue,
      controller: this.controller,
      validator: (val) => _validator(context, val),
    );
  }

  String _validator(BuildContext context, String val) {
    if (val.length > 36) {
      return "Name is very long";
    }
  }
}
