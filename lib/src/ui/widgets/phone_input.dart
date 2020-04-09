import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:location/src/locale.dart';

class PhoneInput extends StatelessWidget {
  final bool isEnabled;
  PhoneInput({
    this.isEnabled = true,
  });
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      isEnabled: this.isEnabled,
      autoValidate: false,
      formatInput: true,
      initialCountry2LetterCode: "SA",
      inputDecoration: InputDecoration(
        // labelText: this.label,
        hintText: AppLocalizations.of(context).phone,
        // errorText: this.error,
        labelStyle: Theme.of(context)
            .inputDecorationTheme
            .labelStyle
            .copyWith(fontSize: 33),
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        border: Theme.of(context).inputDecorationTheme.border,
      ),
    );
  }
}
