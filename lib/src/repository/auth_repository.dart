import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import '../services/firebase/users_firebase.dart';
import '../services/firebase/auth_firebase.dart';

class AuthRepository {
  /*
   * # Handle Logic
   * # Validation
   *  
   * 
   */
  final UsersFirebase _usersService = UsersFirebase();
  final AuthFirebase _authService = AuthFirebase();
  AuthRepository() {}

  Future<User> get authUser => _authUser();
  Future<void> get signout => _authService.signout();

  Future<User> _authUser() async {
    return await _authService.getCurrentUser().then((u) => User((b) => [
          b..id = u.uid,
          b..email = u.email,
          b..phone = u.phoneNumber,
          // b..profilePhoto = fUser.photoUrl,
          b..name = u.displayName
        ]));
  }

  /**
   * 
   * # Register 
   * 
   * 
   */
  Future<User> register({
    @required Map<String, String> credentials,
    method = AuthMethod.EmailAndPassword,
  }) async {
    //#
    //#
    //#
    User _userBasicAuthInfo;
    switch (method) {
      case AuthMethod.PhoneNumber:
        break;
      default:
        // defalut is  AuthMethod.emailAndPassword
        // if (credentials["email"].isEmpty || credentials["password"].isEmpty) {
        //   return throw PlatformException(
        //       code: "Required fileds should not empty");
        // }
        return _userBasicAuthInfo =
            await _authService.registerUsingEmailPassword(
                email: credentials["email"],
                password: credentials["password"],
                name: credentials["name"] == true ? credentials["name"] : null);
    }
  }

  /**
   * 
   * 
   * Sgin In
   * 
   */
  Future<User> signIn({
    @required Map<String, String> credentials,
    method = AuthMethod.EmailAndPassword,
  }) async {
    /*
    *
    *   Authnicate user based on auth method
    *
    */
    User _userBasicAuthInfo;
    switch (method) {
      case AuthMethod.PhoneNumber:
        break;
      default:
        // defalut is  AuthMethod.emailAndPassword
        if (credentials["email"].isEmpty || credentials["password"].isEmpty) {
          return null;
        }
        _userBasicAuthInfo = await _authService.signInWithEmailAndPassword(
            email: credentials["email"], password: credentials["password"]);
    }
    return _userBasicAuthInfo;

    // get user
  }

  // update auth info
  update({@required user}) async {
    try {
      this._authService.updateAuthProfile(user: user);
    } catch (e) {
      _getException(e);
    }
  }

  AuthError _getException(Exception e) {
    print("ERR: " + e.toString());
    if (e is PlatformException) {
      print(e.code + " " + e.message);
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
        case "ERROR_NOT_AUTHORIZED":
          return AuthError.NotAuthorized;
          break;
        default:
          return AuthError.UnknownError;
      }
    } else {
      return AuthError.UnknownError;
    }
  }
}
