import 'dart:async';

import 'package:location/src/app/enums/users_enum.dart';
import 'package:location/src/states/states.dart';
import 'package:location/src/locale.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:location/src/ui/screens/auth/_errors.dart';

class SigninScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>(debugLabel: "_loginForm");
  // login service call
  // ! For TESTING
  // 
  void _mockSginin(BuildContext context) async {
    var _p = Provider.of<AuthState>(context);
    var auth = await _p.mockSginin();
    if (auth == AuthStatus.Successful) {
      _p.reset();
      Navigator.popAndPushNamed(context, "/");
    }
  }

  void _login(BuildContext context) async {
    var _p = Provider.of<AuthState>(context);
    _fbKey.currentState.save();
    if (_fbKey.currentState.validate()) {
      // get values
      String email = _fbKey.currentState.value["email"];
      String password = _fbKey.currentState.value["password"];
      Map<String, String> _cred = {
        "email": email,
        "password": password,
      };
      // call api
      AuthStatus auth = await _p.signIn(credentials: _cred);
      // redirect
      if (auth == AuthStatus.Successful) {
        _p.reset();
        Navigator.popAndPushNamed(context, "/");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var _p = Provider.of<AuthState>(context);
    return CenterLayout(
      canGoBack: true,
      title: _title(context),
      imgUrl: "assets/login.png",
      imgHeight: 120,
      imgWidth: 120,
      color: Theme.of(context).primaryColor,
      childern: <Widget>[
        _showError(context),
        SizedBox(height: 10),
        _form(context),
        SizedBox(height: 20),
        _forgetPassword(context),
        SizedBox(height: 5),
        _createAccount(context),
        SizedBox(height: 10),
        _submitBtn(context)
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context).btnLogin,
      style: TextStyle(fontSize: 22),
    );
  }

  Widget _showError(BuildContext context) {
    var _p = Provider.of<AuthState>(context);

    return Text(
      _p.authError != null ? errorText(context, _p.authError) : "",
      style: TextStyle(color: Colors.redAccent),
    );
  }

  Widget _emailFiled(BuildContext context) {
    return FormBuilderTextField(
      attribute: "email",
      keyboardType: TextInputType.emailAddress,
      // inputFormatters: [BlacklistingTextInputFormatter(RegExp(p))],

      decoration: InputDecoration(
        labelText: "Email",
      ),
      validators: [
        FormBuilderValidators.required(
            errorText: errorText(context, AuthError.EmailNotValid)),
        FormBuilderValidators.email(
            errorText: errorText(context, AuthError.EmailNotValid)),
        FormBuilderValidators.maxLength(140),

        // TODO: Email is exsit
        // TODO: trim
        // (val) => UsersValidation.isExit(val),

        //
      ],
    );
  }

  Widget _passwordFiled(BuildContext context) {
    return FormBuilderTextField(
      attribute: "password",
      obscureText: true,
      decoration: InputDecoration(
          labelText: '${AppLocalizations.of(context).password}'),
      validators: [
        FormBuilderValidators.required(
            errorText: '${AppLocalizations.of(context).passwordNotValid}'),
        FormBuilderValidators.maxLength(170),
        FormBuilderValidators.minLength(6),
      ],
    );
  }

  Widget _submitBtn(BuildContext context) {
    var authProvider = Provider.of<AuthState>(context);
    return FlatButton(
      color: Theme.of(context).buttonColor,
      child: authProvider.authStatus == AuthStatus.Busy
          ? CircularProgressIndicator()
          : Text(AppLocalizations.of(context).btnSend),
      onPressed: authProvider.authStatus == AuthStatus.Busy
          ? null
          : () => this._mockSginin(context),
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: Text('${AppLocalizations.of(context).passwordRest}'),
          onTap: () => Navigator.pushNamed(context, '/auth/password-reset'),
        )
      ],
    );
  }

  Widget _createAccount(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: Text('${AppLocalizations.of(context).btnRegister}'),
          onTap: () => null,
        )
      ],
    );
  }

  Widget _form(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      autovalidate: false,
      child: Column(
          children: <Widget>[_emailFiled(context), _passwordFiled(context)]),
    );
  }
}
