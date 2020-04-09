import 'package:location/src/locale.dart';
import 'package:location/src/states/auth_state.dart';
import 'package:location/src/ui/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefalutLayout(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
      ),
      drawer: Drawer(child: _drawerList(context)),
      content: Center(
        child: Text(
          AppLocalizations.of(context).hello,
          textScaleFactor: 4.2,
        ),
      ),
    );
  }

  Widget _drawerList(BuildContext context) {
    var authProvider = Provider.of<AuthState>(context);
    final _list = [
      {"text": "Home", "route": "/", "icon": ""},
      {"text": "About", "route": "/settings/about", "icon": ""},
      {"text": "Login", "route": "/auth/signin", "icon": ""},
      {"text": "Register", "route": "/auth/signup", "icon": ""},
            {"text": "Phone", "route": "/auth/phone-signin", "icon": ""},
      {"text": "Private", "route": "/private", "icon": "", "auth": true}
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  child: ListTile(
                    title: Text(
                      AppLocalizations.of(context).appTitle,
                      textScaleFactor: 1.9,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      authProvider.isLoggendIn
                          ? authProvider.authUser.email
                          : "",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    trailing: !authProvider.isLoggendIn
                        ? null
                        : FlatButton(
                            color: Colors.blueAccent,
                            child: Text(
                                '${AppLocalizations.of(context).btnLogout}'),
                            onPressed: () async {
                              await authProvider.signOut();
                            },
                          ),
                    contentPadding: EdgeInsets.only(
                        top: 40, left: 10, bottom: 10, right: 10),
                  ),
                  color: Colors.black26),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index) {
              if (_list[index].containsKey("auth") &&
                  !authProvider.isLoggendIn) {
                return Container();
              }
              return _item(context, _list[index]);
            },
          ),
        ),
        _actions(context),
      ],
    );
  }

  Widget _item(BuildContext context, Map list) {
    return ListTile(
      dense: true,
      title: Text(
        list['text'].toString(),
        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
      ),
      onTap: () {
        Navigator.pushNamed(context, list['route']);
      },
    );
  }

  Widget _actions(BuildContext context) {
    var authProvider = Provider.of<AuthState>(context);

    return Row(
      children: <Widget>[
        if (authProvider.isLoggendIn) ...{
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 30,
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        }
      ],
    );
  }
}
