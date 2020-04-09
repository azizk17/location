import 'package:location/src/app/enums/enums.dart';
import 'package:flutter/services.dart';

getUsersExceptions(Exception e) {
  if (e is PlatformException) {
    switch (e.code) {
      case "ERROR_WRONG_PASSWORD":
        return AuthError.PasswordNotValid;
        break;
      case "ERROR_USER_NOT_FOUND":
        return AuthError.UserNotFound;
        break;
      case "ERROR_INVALID_EMAIL":
        return AuthError.EmailNotValid;
        break;
      default:
        return AuthError.UnknownError;
    }
  } else {
    return AuthError.UnknownError;
  }
}
