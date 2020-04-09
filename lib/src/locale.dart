import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './i18n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /**
   * 
   * local messages
   */

  String get appTitle {
    return Intl.message('My APP',
        name: 'appTitle', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  /**
   * *# Auth and Users
   */
  // ? Messages
  String get youLoggedIn {
    return Intl.message('You already logged in', name: 'youLoggedIn');
  }
  String get sginInSuccess {
    return Intl.message('You are logged in', name: 'sginInSuccess');
  }
  String get sginInFaild {
    return Intl.message('', name: 'sginInFaild');
  }
  String get logoutMsg {
    return Intl.message('You Logged Out', name: 'logoutMsg');
  }
  String get passwordRest {
    return Intl.message('Forget Password', name: 'passwordRest');
  }
  String get verifyEmail {
    return Intl.message('Please Verify Your Email', name: 'verifyEmail');
  }
  String get verifyPhone {
    return Intl.message('Please Verify Your Phone Number', name: 'verifyPhone');
  }
  // ? Attributes
  String get email {
    return Intl.message('Email', name: 'email');
  }
  String get password {
    return Intl.message('Password', name: 'password');
  }
  String get phone {
    return Intl.message('Phone Number', name: 'phone');
  }
  String get name {
    return Intl.message('name', name: 'name');
  }
  String get profilePhoto {
    return Intl.message('Profile Photo', name: 'profilePhoto');
  }
   String get registerAt {
    return Intl.message('Joined At', name: 'registerAt');
  }
  String get lastLogin {
    return Intl.message('Last Login', name: 'lastLogin');
  }
  // ? Errors and Validations
  String get intenetConnectionFaild {
    return Intl.message('Connection is lost !!', name: 'intenetConnectionFaild');
  }
  String get intenetConnectionSuccess {
    return Intl.message('You are connected', name: 'intenetConnectionSuccess');
  }
  String get unknownError {
    return Intl.message('Something Went Wrong !!', name: 'unknownError');
  }
  String isRequired(String filed) => Intl.message('$filed is required', name: 'isRequired', args: [filed]);
  
  String get incorrectCredentials {
    return Intl.message('Credentials are not correct', name: 'incorrectCredentials');
  }
   String get emailNotValid {
    return Intl.message('Email Address is not Valied', name: 'emailNotValid');
  }
  String get emailIsUsed {
    return Intl.message('This email has been used ', name: 'emailIsUsed');
  }
  String get userNotFound {
    return Intl.message('You Dont have account with this email', name: 'userNotFound');
  }
  String get passwordNotValid {
    return Intl.message('Password must be in correct pattren', name: 'passwordNotValid');
  }
  
  String get termsMsg {
    return Intl.message(
        'By creating an account, you are agreeing to our Terms of Service and Privacy Policy',
        name: 'termsMsg');
  }
  String get termsOfService {
    return Intl.message(
        'Terms of Service',
        name: 'termsOfService');
  }
  String get privacyPolicy {
    return Intl.message(
        'Privacy Policy',
        name: 'privacyPolicy');
  }

  String get enterYourPhoneMsg {
    return Intl.message('Enter your phone number', name: 'enterYourPhoneMsg');
  }

  String get invalidPhoneNumber {
    return Intl.message(
      'phone number is incorrect',
      name: 'invalidPhoneNumber',
    );
  }
  

  String get enterVerifiCodeMsg {
    return Intl.message('Enter varification code', name: 'enterVerifiCodeMsg');
  }

  String get invalidVerifiCodeMsg {
    return Intl.message('varification code is incorrect',
        name: 'invalidVerifiCodeMsg');
  }

  String get waitResendMsg {
    return Intl.message('Wait 3 mintes to send agine', name: 'waitResendMsg');
  }

  String get phoneFormatErr {
    return Intl.message('Please enter a correct phone number',
        name: 'phoneFormatErr');
  }
  // buttons
  String get btnSend {
    return Intl.message('Send', name: 'btnSend');
  }

  String get btnCancel {
    return Intl.message('Cancel', name: 'btnCancel');
  }

  String get btnSave {
    return Intl.message('Save', name: 'btnSave');
  }

  String get btnRegister {
    return Intl.message('Register', name: 'btnRegister');
  }

  String get btnLogin {
    return Intl.message('Login', name: 'btnLogin');
  }
   String get btnLogout {
    return Intl.message('Logout', name: 'btnLogout');
  }

  String get btnAgree {
    return Intl.message('Agree', name: 'btnAgree');
  }
  // ? Settings
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
    );
  }
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
    );
  }
  String get notifications {
    return Intl.message(
      'notifications',
      name: 'notifications',
    );
  }
  String get about {
    return Intl.message(
      'About',
      name: 'about',
    );
  }
  String get contact {
    return Intl.message(
      'Contact us',
      name: 'contact',
    );
  }
  
  String get permissions {
    return Intl.message(
      'Permissions',
      name: 'permissions',
    );
  }
   String get share {
    return Intl.message(
      'Share',
      name: 'share',
    );
  }

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
