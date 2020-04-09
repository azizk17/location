import 'package:location/src/locale.dart';
import 'package:location/src/ui/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

/**
 * 
 *  Notifications App Configrations and settings
 * 
 */

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefalutLayout(
      title: Text(AppLocalizations.of(context).settings),
      content: Center(
        child: Text("Notifications Settings", textScaleFactor: 2.2,),
      ),
    );
  }
}
