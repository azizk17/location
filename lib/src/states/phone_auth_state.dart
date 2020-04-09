import 'package:location/src/states/states.dart';
import 'package:flutter/cupertino.dart';

import './base_state.dart';
import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/services/firebase/auth_firebase.dart';
import 'package:meta/meta.dart';

class PhoneAuthState extends BaseState {
  final _authService = AuthFirebase();

  // AuthStatus _status;
  PhoneAuthStatus _status;
  // AuthStatus get status => _status;
  PhoneAuthStatus get status => _status;

  String _phoneNumber;
  String _pinCode;

  String get phoneNumber => _phoneNumber;
  String get pinCode => _pinCode;

  Function get setPhoneNumber => _setPhoneNumber;
  Function get setPinCode => _setPinCode;

  Function get verifyPhoneNumber => _verifyPhoneNumber;
  Function get phoneSignin => _phoneSignin;

  // Validations
  Function get validate => _setValid;
  bool _isphoneNumberValid = false;
  bool _isPinCodeValid = false;
  bool get isPhoneNumberValid => _isphoneNumberValid;
  bool get isPinCodeValid => _isPinCodeValid;

  bool get isCodeSent => this.status == PhoneAuthStatus.CodeSent ? true : false;

  PhoneAuthState() {
    this.reset();
    notifyListeners();
  }

  // setMsg(String msg) {}
  _setStatus(PhoneAuthStatus status) {
    this._status = status;
    notifyListeners();
  }

  _setValid({bool phoneNumber, bool pinCode}) {
    // TODO: isolate validation in sepreate class instead of relaing on ui to do this job
    if (phoneNumber != null) {
      this._isphoneNumberValid = phoneNumber;
    }
    if (pinCode != null) {
      this._isPinCodeValid = pinCode;
    }
    notifyListeners();
  }

  _setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
    notifyListeners();
  }

  _setPinCode(String pin) {
    this._pinCode = pin;
    notifyListeners();
  }

  void init() {
    this.reset();
    this
        ._authService
        .phoneAuthStatus
        .listen((value) => {print(value.toString())});
  }

  /**
   * 
   *  # First phone number must be verified,
   *  then phoneSignin should be called
   */
  //
  _verifyPhoneNumber(String phoneNumber) async {
    try {
      await this._authService.verifyPhoneNumber(phoneNumber: phoneNumber);
      // await this.mockSginin(id: "sdsfsdfsdf");
    } catch (e) {
      print("Error: " + e.toString());
    }

    // this._authService.verifyPhoneNumber(phoneNumber: phoneNumber);
  }

  //
  _phoneSignin({@required String smsCode}) {}

  /**
   * For testing
   */
  Future<PhoneAuthStatus> mockSginin({String id}) async {
    _setStatus(PhoneAuthStatus.Sending);
    // User u = User((b) => [
    //       b..id = '22Test',
    //       b..name = 'aziz',
    //       b..email = 'aziz@aziz.com',
    //       b..phone = '000989732',
    //     ]);
    await Future.delayed(const Duration(milliseconds: 2000));
    var status = PhoneAuthStatus.CodeSent; // or faild
    _setStatus(status);
    // _setAuthUser(u);
    return Future.value(status);
  }

  void reset() {
    print("Rest called");
    this.setPhoneNumber(null);
    this._setStatus(PhoneAuthStatus.Started);
    notifyListeners();
  }
}
