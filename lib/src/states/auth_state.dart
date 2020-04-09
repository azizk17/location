import 'dart:async';
import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/app/enums/users_enum.dart';
import 'package:location/src/states/app_state.dart';
import 'package:location/src/states/base_state.dart';
import 'package:location/src/repository/repository.dart';
import 'package:location/src/states/users_state.dart';
import 'package:location/src/validations/base_validation.dart';
import 'package:location/src/validations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/src/models/models.dart';
import 'package:location/src/app/enums/enums.dart';

import 'package:meta/meta.dart';

class AuthForm {
  final String email;
  final String password;
  final bool isLoading;
  final bool canSubmit;
  final bool sucsses;
  AuthForm(
      {this.email = "",
      this.password: "",
      this.isLoading,
      this.canSubmit,
      this.sucsses});
  AuthForm copyWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    return AuthForm(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      canSubmit: canSubmit ?? this.canSubmit,
      sucsses: sucsses ?? this.sucsses,
    );
  }
}

class AuthState extends BaseState {
  // TODO: Form validitions and trim
  final _authRepo = AuthRepository();
  // ? Mock login - TESTING

  User get authUser => _authUser;
  User _authUser;
  AuthError _erros;
  AuthStatus _authStatus;
  AuthError get authError => _erros;
  AuthStatus get authStatus => _authStatus;
  // PublishSubject<FormStatus> _formStatus = PublishSubject<FormStatus>();
  // Stream<FormStatus> get authFormStream => _formStatus.stream;
  // Function(FormStatus) get authFormUpdate => _formStatus.sink.add;
  Function get register => _register;
  Function get signIn => _signIn;
  Function get signOut => _signOut;
  bool get isLoggendIn => _authUser != null ? true : false;

  void listenToError() {}

  void validateForm() {
    var user =
        User().rebuild((b) => [b..name = "wewfrwe", b..email = "aa@wss.ce"]);
    var v = UsersValidation().validate(user, fields: ["email", "name"]);
    notifyListeners();
  }

  void _setAuthError(AuthError error) {
    _erros = error;
    notifyListeners();
  }

  void _setAuthStatus(AuthStatus status) {
    _authStatus = status;
    notifyListeners();
  }

  void _setAuthUser(User user) {
    _authUser = user;
    notifyListeners();
  }

  AuthState() {
    // rest data
    this.reset();
    notifyListeners();
  }
  void _signOut() {
    // TODO: repo call to remove user from local db
    this._authRepo.signout;
    this.reset();
    this._setAuthUser(null);

    notifyListeners();
  }

  Future<AuthStatus> _register(
      {@required Map<String, String> credentials, AuthMethod method}) async {
    try {
      print("DATA1" + credentials.toString());
      // set busy
      _setAuthStatus(AuthStatus.Busy);
      // service call
      User _u =
          await _authRepo.register(credentials: credentials, method: method);
      _setAuthStatus(AuthStatus.Successful);
      _setAuthUser(_u);
      return this.authStatus;
    } catch (e) {
      print("What err" + e.toString());
      AuthError _err = _getException(e);
      _setAuthError(_err);
      _setAuthStatus(AuthStatus.Failed);
      return AuthStatus.Failed;
    }
    // set and return status
  }

  // sgin in
  Future<AuthStatus> _signIn({
    @required Map<String, String> credentials,
    AuthMethod method,
  }) async {
    //
    try {
      _setAuthStatus(AuthStatus.Busy);

      User _user =
          await _authRepo.signIn(credentials: credentials, method: method);
      _setAuthStatus(AuthStatus.Successful);
      _setAuthUser(_user);

      return AuthStatus.Successful;
    } catch (e) {
      AuthError _err = _getException(e);
      _setAuthError(_err);
      _setAuthStatus(AuthStatus.Failed);
      return AuthStatus.Failed;
    }
  }

  bool isOwner(String id) {
    if (authUser.id != id) {
      return false;
    }
    return true;
  }

  // update auth user
  update({@required User user}) async {
    // if (!isOwner(user.id)) {
    //   return AuthError.NotAuthorized;
    // }
    await this._authRepo.update(user: user);
  }

  // remove account
  remove() {}

  /*
   *  Handle Api calls exceptions
   */
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
        default:
          return AuthError.UnknownError;
      }
    } else {
      return AuthError.UnknownError;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void reset() {
    // TODO: implement reset
    _setAuthError(null);
    _setAuthStatus(null);
    super.reset();
  }

  Future<AuthStatus> mockSginin({String id}) async {
    _setAuthStatus(AuthStatus.Busy);
    User u = User((b) => [
          b..id = '22Test',
          b..name = 'aziz',
          b..email = 'aziz@aziz.com',
          b..phone = '000989732',
        ]);
    await Future.delayed(const Duration(milliseconds: 2000));
    var status = AuthStatus.Successful; // or faild
    _setAuthStatus(status);
    _setAuthUser(u);
    return Future.value(status);
  }
}
