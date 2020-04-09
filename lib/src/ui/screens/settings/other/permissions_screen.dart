import 'package:location/src/locale.dart';
import 'package:location/src/states/permissions_state.dart';
import 'package:location/src/ui/widgets/layouts/default_layout.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 * 
 *  Notifications App Configrations and settings
 * 
 */

class PermissionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var per = Provider.of<PermissionsState>(context);
   per.init();
    return DefalutLayout(
        title: Text(AppLocalizations.of(context).settings),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text("contacts " + per.contacts.toString()),
            Btn(
              child: Text("open permissions"),
              // onPressed: per.openAppSettings,
            )
          ],
        )); 
  }
}
