import 'package:flutter/widgets.dart';

class LocaleBloc extends ChangeNotifier {
  Function(String) get t => getLocale;


  String getLocale(String key) {
    return "Try This" + key;
  }
}