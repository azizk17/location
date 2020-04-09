import 'package:location/src/locale.dart';
import 'package:location/src/models/models.dart';
import 'package:location/src/states/states.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>(debugLabel: "update");

  User initUser;

  void init(BuildContext context) {
    // inital data
    var _pu = Provider.of<UsersState>(context);
    var _pa = Provider.of<AuthState>(context);
    var user = User().rebuild((b) => [
          b..name = _pa.authUser.name,
          b..email = _pa.authUser.email,
          b..phone = _pa.authUser.phone,
        ]);

    UserBuilder b = UserBuilder();
    b.build();
    initUser = b.build();
  }

  void initState(BuildContext context) {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) => init(context));
    }
  }

  String hasError(BuildContext context, String feild) {
    var errors = Provider.of<UsersState>(context, listen: true).fErrors;
    if (errors.containsKey(feild)) {
      return errors[feild].message;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: _body(context),
      backgroundColor: Colors.grey,
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _hed(context),
          _listItems(context, _b_list(context)),
        ],
      ),
    );
  }

  Widget _hed(BuildContext context) {
    return Card();
  }

  Widget _listBuilder(BuildContext context) {
    var _p = Provider.of<UsersState>(context);
    var _auth = Provider.of<AuthState>(context);
    var u = User();
    u = u.rebuild((b) => b..email = _auth.authUser.email);
    var email;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          EmailField(
              label: "Email",
              value: u.email,
              error: hasError(context, 'email'),
              onChanged: (val) {
                u = u.rebuild((b) => b..email = val);
                u = u.rebuild((b) => b..name = val);
              }),
          FlatButton(
              child: Text("Click"),
              onPressed: () {
                print('R ' + u.toString());
                print('Auth user ' + _auth.authUser.toString());
                _p.validate(u, fields: ['email']);
              })
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _list_1(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return [
      {
        "title": "EMAIL",
        "leading": Image.asset("assets/002-gear.png"),
        "subtitle": auth.authUser.email,
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "pasword",
        "leading": Image.asset("assets/001-lock.png"),
        "onTap": () => print("EREERERERERRER"),
      },
    ];
  }

  List<Map<String, dynamic>> _list_2(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return [
      {
        "title": "EMAIL",
        "leading": Image.asset("assets/002-gear.png"),
        "subtitle": auth.authUser.email,
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "pasword",
        "leading": Image.asset("assets/001-lock.png"),
        "onTap": () => print("EREERERERERRER"),
      },
    ];
  }

  List<Map<String, dynamic>> _b_list(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return [
      {
        "title": "EMAIL",
        "leading": Image.asset("assets/002-gear.png"),
        "subtitle": auth.authUser.email,
        "trailing": "verfied",
        "onTap": () => print("email")
      },
      {
        "title": "pasword",
        "leading": Image.asset("assets/001-lock.png"),
        "onTap": () => print("EREERERERERRER"),
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {'space': true},
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
      {
        "title": "phone",
        "leading": Image.asset("assets/003-pin.png"),
        "subtitle": auth.authUser.phone,
        "trailing": "",
        "onTap": () => print("phone")
      },
    ];
  }

  _listItems(BuildContext context, List<Map<String, dynamic>> list) {
    var items = _b_list(context).toList();

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.separated(
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var leading = items[index]['leading'];
            var title = items[index]['title'];
            var subtitle = items[index]['subtitle'];
            var trailing = items[index]['trailing'];
            var onTap = items[index]['onTap'];
            if (items[index]['space']) {
              return SizedBox(
                height: 40,
              );
            }
            return ListTile(
              leading: leading != null ? leading : null,
              title: title != null ? Text(title) : null,
              subtitle: subtitle != null ? Text(subtitle) : null,
              trailing: trailing != null ? Text(trailing) : null,
              onTap: onTap != null ? onTap : null,
              dense: true,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
            );
          }),
    );
  }

  void _saveForm(BuildContext context) async {
    var _p = Provider.of<UsersState>(context);
    _fbKey.currentState.save();
    if (_fbKey.currentState.validate()) {
      // get values
      String name = _fbKey.currentState.value["email"];
      var u = User((b) => b..name = name);
      // _p.saveUser(u);
    }
  }
}
