import 'package:location/src/locale.dart';
import 'package:location/src/states/states.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

/**
 * 
 *    A list of app settings and pages like About page
 * 
 */
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    this._addTolist(context);
    return DefalutLayout(
      content: Container(
        color: Colors.white,
        child: ListViewSettings(this._addTolist(context)),
      ),
    );
  }

  _addTolist(BuildContext context) {
    return [
      ListVeiwItemModel.section(),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).settings,
        icon: Icons.settings,
        bgColor: Colors.blue,
        onTap: () => Navigator.pushNamed(context, "/settings/app"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).account,
        icon: Icons.person,
        bgColor: Colors.deepPurple,
        onTap: () => Navigator.pushNamed(context, "/settings/account"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).notifications,
        icon: Icons.notifications,
        bgColor: Colors.redAccent,
        onTap: () => Navigator.pushNamed(context, "/settings/notifications"),
      ),
      ListVeiwItemModel.section(),
      // section 2
      ListVeiwItemModel(
        title: AppLocalizations.of(context).about,
        icon: Icons.insert_emoticon,
        bgColor: Colors.indigo,
        onTap: () => Navigator.pushNamed(context, "/settings/about"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).termsOfService,
        icon: Icons.description,
        bgColor: Colors.amberAccent,
        onTap: () async => await _launchURL(
            "https://help.github.com/en/articles/github-terms-of-service"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).privacyPolicy,
        icon: Icons.lock_outline,
        bgColor: Colors.teal,
        onTap: () async => await _launchURL(
            "https://help.github.com/en/articles/github-privacy-statement"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).contact,
        icon: Icons.phone,
        bgColor: Colors.lightGreen,
        onTap: () => Navigator.pushNamed(context, "/settings/contact"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).permissions,
        icon: Icons.perm_device_information,
        bgColor: Colors.brown,
        onTap: () => Navigator.pushNamed(context, "/settings/permissions"),
      ),
      ListVeiwItemModel(
        title: AppLocalizations.of(context).share,
        icon: Icons.share,
        bgColor: Colors.pink,
        onTap: () => Share.share('check out my website https://example.com'),
      ),

      ListVeiwItemModel.section(
        subtitle: AppLocalizations.of(context).termsMsg,
      ),
    ];
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
