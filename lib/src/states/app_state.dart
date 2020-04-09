import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier{
  Map<String, String> settings;

  get getSettings => settings;
  String get name => "Hello Future";
 
}