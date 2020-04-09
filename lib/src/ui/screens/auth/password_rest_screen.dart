import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';


class PasswordRest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenterLayout(
      title: Text("data"),
      childern: <Widget>[
        Text("Rest Password ", textScaleFactor: 2.1,)
      ],
    );
  }
}
