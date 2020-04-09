import 'package:location/src/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrivateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _info(context),
            Text(
              "Only logged in users can see this page",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(BuildContext context) {
    var _p = Provider.of<AuthState>(context);
    return ListTile(
      title: Text("Your Email:"),
      subtitle: Text('${_p.authUser.email}'),
    );
  }
}
