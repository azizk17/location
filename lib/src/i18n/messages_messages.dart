// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Hello world App"),
    "btnAgree" : MessageLookupByLibrary.simpleMessage("Agree"),
    "btnCancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "btnLogin" : MessageLookupByLibrary.simpleMessage("Login"),
    "btnRegister" : MessageLookupByLibrary.simpleMessage("Register"),
    "btnSave" : MessageLookupByLibrary.simpleMessage("Save"),
    "btnSend" : MessageLookupByLibrary.simpleMessage("Send"),
    "enterVerifiCodeMsg" : MessageLookupByLibrary.simpleMessage("Enter varification code"),
    "enterYourPhoneMsg" : MessageLookupByLibrary.simpleMessage("Enter your phone number"),
    "hello" : MessageLookupByLibrary.simpleMessage("Hello"),
    "invalidPhoneNumber" : MessageLookupByLibrary.simpleMessage("phone number is incorrect"),
    "invalidVerifiCodeMsg" : MessageLookupByLibrary.simpleMessage("varification code is incorrect"),
    "phoneFormatErr" : MessageLookupByLibrary.simpleMessage("Please enter a correct phone number"),
    "termsMsg" : MessageLookupByLibrary.simpleMessage("Read our Privacy terms. Tap \"Agree\" to accept the terms of services"),
    "waitResendMsg" : MessageLookupByLibrary.simpleMessage("Wait 3 mintes to send agine")
  };
}
