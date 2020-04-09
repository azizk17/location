import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/locale.dart';
import 'package:flutter/widgets.dart';

String errorText(BuildContext context, AuthError e) {
  switch (e) {
    case AuthError.UserNotFound:
      return AppLocalizations.of(context).incorrectCredentials;
      break;
    case AuthError.EmailNotValid:
      return AppLocalizations.of(context).incorrectCredentials;
    default:
      return AppLocalizations.of(context).enterVerifiCodeMsg;
  }
}
