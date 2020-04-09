import 'dart:async';

import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/models/user_model.dart';
import 'package:location/src/services/firebase/_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class AuthFirebase {
  static var actualCode;
  get authUser =>
      FirebaseAuth.instance.currentUser().then((u) => this._parse(u));
  Stream get onAuthChanged =>
      FirebaseAuth.instance.onAuthStateChanged.map((u) => this._parse(u));

  BehaviorSubject<PhoneAuthStatus> _phoneStatusSubject =
      new BehaviorSubject<PhoneAuthStatus>();
  Stream get phoneAuthStatus => _phoneStatusSubject.stream;
  AuthFirebase() {
    FirebaseAuth.instance.setLanguageCode("ar");
  }

  Function get verifyPhoneNumber => _verifyPhoneNumber;

  User _parse(FirebaseUser fUser) {
    return User((b) => [
          b..id = fUser.uid,
          b..email = fUser.email,
          b..phone = fUser.phoneNumber,
          // b..profilePhoto = fUser.photoUrl,
          b..name = fUser.displayName
        ]);
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    // ? parsing is not recommend since the returned object has useful functions
    return _user;
  }

  Future<User> registerUsingEmailPassword(
      {@required String email,
      @required String password,
      String name,
      String photoUrl,
      String phoneNumber}) async {
    // create auth user
    print("DATA: " + email.toString());
    FirebaseUser user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        as FirebaseUser;
    // save user profile to auth user
    // var _u = UserUpdateInfo();
    // _u.displayName = name;
    // _u.photoUrl = photoUrl;
    // await user.updateProfile(_u);
    // save auth user in users table

    // send vervication email
    // return user
    return _parse(user);
  }

  Future<User> signInWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password)) as FirebaseUser;
    print(user.toString());
    return _parse(user);
  }

  Future<void> updateAuthProfile({@required User user}) async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    print("CURREENT USER " + currentUser.displayName);
    UserUpdateInfo u = UserUpdateInfo();
    // name - photoURL
    if (user.name != null) {
      u.displayName = user.name;
    }
    if (user.avatar != null) {
      u.photoUrl = user.avatar;
    }
    try {
      await currentUser.updateProfile(u);
      await currentUser.reload();
    } catch (e) {
      print("EXCEPTIONS " + e.toString());
    }
  }

  // Future<bool> changePassword(String id, String password) {}
  // Future<bool> changeEmail(String id, String email) {}

  /**
   * Phone Signin
   */
  Future<void> _verifyPhoneNumber({String phoneNumber}) async {
    // #codesent
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      actualCode = verificationId;
      // # TODO: use stream to update the state
      // setStatus("\nEnter the code sent to " + phone);
      _phoneStatusSubject.add(PhoneAuthStatus.CodeSent);
      // setPhoneState(PhoneAuthState.CodeSent);
    };
    // # PhoneCodeAutoRetrievalTimeout
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      actualCode = verificationId;
      //
    };
    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      // setStatus('${authException.message}');
      // setPhoneState(PhoneAuthState.Error);
      _phoneStatusSubject.add(PhoneAuthStatus.Failed);

      if (authException.message.contains('not authorized'))
        // setStatus('App not authroized');
        print("");
      else if (authException.message.contains('Network'))
        // setStatus('Please check your internet connection and try again');
        print("");
      else
        print("");

      // setStatus('Something has gone wrong, please try later ' +
      // authException.message);
    };
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential auth) {
      // setStatus('Auto retrieving verification code');
      _phoneStatusSubject.add(PhoneAuthStatus.Verified);

      FirebaseAuth.instance.signInWithCredential(auth).then((AuthResult value) {
        if (value.user != null) {
          // setStatus(status = 'Authentication successful');
          // setPhoneState(PhoneAuthState.Verified);
          _phoneStatusSubject.add(PhoneAuthStatus.Successful);

          // onAuthenticationSuccessful();
        } else {
          _phoneStatusSubject.add(PhoneAuthStatus.Failed);

          // setPhoneState(PhoneAuthState.Failed);
          // setStatus('Invalid code/invalid authentication');
        }
      }).catchError((error) {
        // setPhoneState(PhoneAuthState.Error);
        _phoneStatusSubject.add(PhoneAuthStatus.Error);

        // setStatus('Something has gone wrong, please try later $error');
      });
    };
    // # verifyPhoneNumber
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // !! must fix
  static void signInWithPhoneNumber({String smsCode}) async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);
  }

  void _signin(aa) async {
    FirebaseAuth.instance
        .signInWithCredential(aa)
        .then((AuthResult result) async {
      // setStatus('Authentication successful');
      // setPhoneState(PhoneAbuthState.Verified);
      // onAuthenticationSuccessful();
    }).catchError((error) {
      // setPhoneState(PhoneAuthState.Error);
      // setStatus(
      //     'Something has gone wrong, please try later(signInWithPhoneNumber) $error');
    });
  }

  Future<bool> verfiyEmail(String id, String email) {}
  Future<bool> isEmailVerified(String id, String email) {}
  Future<bool> isPhoneVerified(String id, String phone) {}
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
