import 'package:location/src/app/enums/enums.dart';
import 'package:flutter/services.dart';

AuthError getException(Exception e) {
  if (e is PlatformException) {
    switch (e.code) {
      case "ERROR_WRONG_PASSWORD":
        return AuthError.PasswordNotValid;
        break;
      case "ERROR_USER_NOT_FOUND":
        return AuthError.UserNotFound;
        break;
      default:
        return AuthError.UnknownError;
    }
  } else {
    return AuthError.UnknownError;
  }
}
