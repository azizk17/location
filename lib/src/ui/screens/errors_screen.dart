import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenterLayout(
      title: Container(),
      color: Colors.grey,
      childern: <Widget>[
        SizedBox(height: 120,),
        Text("NOT FOUND", style: TextStyle(fontSize: 22, color: Colors.black),),
        SizedBox(height: 20,),
        FlatButton(
          color: Colors.grey,
          child: Text("GO BACK"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}

class NotAllowed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenterLayout(
      title: Container(),
      color: Colors.redAccent,
      childern: <Widget>[
        SizedBox(height: 120,),
        Text("NOT ALLOWED", style: TextStyle(fontSize: 22, color: Colors.black),),
        SizedBox(height: 20,),
        FlatButton(
          color: Colors.grey,
          child: Text("GO BACK"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
