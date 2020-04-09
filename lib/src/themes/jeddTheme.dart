import 'package:flutter/material.dart';

/**
 * 
 * # Colors
 */

const jeddPrimary = const Color(0xFF351330);
const jeddAccent = const Color(0xFF26ADE4);
const jeddCanvasColor = const Color(0xFFA8CABA);
const jeddGreenLight = const Color(0xFFCAD7B2);

const jeddGreenLime = const Color(0xFFEBE3AA);

const jeddErrorRed = const Color(0xFFC5032B);

const jeddSurfaceWhite = const Color(0xFFFFFBFA);
const jeddBackgroundWhite = Colors.white;
const greyLight = Color.fromRGBO(236, 240, 241, 2);

// ? Fonts
const double fontSize = 11.0;
final TextStyle textStyle = TextStyle(
  color: jeddPrimary,
  fontSize: fontSize,
  fontStyle: FontStyle.normal,
  
);

final TextStyle errorTextStyle = textStyle.copyWith(color: jeddErrorRed);

final InputDecoration inputDecoration = InputDecoration(
  fillColor: Colors.blue,
  border: OutlineInputBorder(
      borderSide:
          BorderSide(color: jeddPrimary, width: 1.2, style: BorderStyle.solid)),
  errorStyle: errorTextStyle,
);

final inputDecorationTheme = InputDecorationTheme(
  labelStyle: textStyle,
  border: OutlineInputBorder(
      borderSide:
          BorderSide(color: jeddPrimary, width: 3.1, style: BorderStyle.solid)),
  errorStyle: errorTextStyle,
  isCollapsed: true,
  hintStyle: textStyle.copyWith(color: jeddPrimary.withOpacity(0.7))
);
// TODO: Build Theme (103)
final ThemeData jeddTheme = _buildJeddTheme();

ThemeData _buildJeddTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: jeddPrimary,
    accentColor: jeddAccent,
    buttonColor: jeddAccent,
    scaffoldBackgroundColor: jeddBackgroundWhite,
    cardColor: jeddBackgroundWhite,
    textSelectionColor: jeddAccent,
    errorColor: jeddErrorRed,
    // TODO: Add the text themes (103)
    textTheme: _buildJeddTextTheme(base.textTheme),
    primaryTextTheme: _buildJeddTextTheme(base.primaryTextTheme),

    // TODO: Add the icon themes (103)
    primaryIconTheme: base.iconTheme.copyWith(
      color: jeddGreenLime,
    ),

    // TODO: Decorate the inputs (103)
    inputDecorationTheme: inputDecorationTheme,
  );
}

TextTheme _buildJeddTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 13.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 11.0,
        ),
      )
      .apply(  
        // fontFamily: 'AraJozoor',
        displayColor: jeddAccent,
        bodyColor: jeddCanvasColor,
      );
}
