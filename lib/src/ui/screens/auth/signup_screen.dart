import 'package:location/src/app/enums/enums.dart';
import 'package:location/src/states/states.dart';
import 'package:location/src/locale.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:location/src/validations/users_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  void _register(BuildContext context) async {
    final _authState = Provider.of<AuthState>(context);
    // save form data
    _fbKey.currentState.save();
    // map
    Map<String, String> credentials = {
      "email": _fbKey.currentState.value["email"],
      "password": _fbKey.currentState.value["password"],
      "name": _fbKey.currentState.value["name"],
    };
    // validate and service call
    if (_fbKey.currentState.validate()) {
      final status = await _authState.register(credentials: credentials);
      if (status == AuthStatus.Successful) {
        Navigator.popAndPushNamed(context, '/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CenterLayout(
      color: Theme.of(context).primaryColor,
      title: _title(context),
      imgUrl: "assets/login.png",
      imgHeight: 120,
      imgWidth: 120,
      childern: <Widget>[
        SizedBox(
          height: 10,
        ),
        _form(context),
        SizedBox(
          height: 20,
        ),
        Text(AppLocalizations.of(context).termsMsg),
        SizedBox(
          height: 10,
        ),
        _submitBtn(context)
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context).btnRegister,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _emailFiled(BuildContext context) {
    return FormBuilderTextField(
      attribute: "email",
      decoration:
          InputDecoration(labelText: AppLocalizations.of(context).email),
      validators: [
        FormBuilderValidators.email(
            errorText: AppLocalizations.of(context).emailNotValid),
        FormBuilderValidators.maxLength(170),
        // TODO: Email is exsit
        // (val) => UsersValidation.isExit(val),

        //
      ],
    );
  }

  Widget _passwordFiled(BuildContext context) {
    return FormBuilderTextField(
      attribute: "password",
      obscureText: true,
      decoration:
          InputDecoration(labelText: AppLocalizations.of(context).password),
      validators: [
        FormBuilderValidators.maxLength(170),
        FormBuilderValidators.minLength(6,
            errorText: AppLocalizations.of(context).passwordNotValid),
      ],
    );
  }

  Widget _nameFiled(BuildContext context) {
    return FormBuilderTextField(
      attribute: "name",
      decoration: InputDecoration(labelText: AppLocalizations.of(context).name),
      validators: [
        FormBuilderValidators.maxLength(120),
        // TODO: has contais string or numbers ONLY
      ],
    );
  }

  Widget _submitBtn(BuildContext context) {
    final _authState = Provider.of<AuthState>(context);
    return FlatButton(
      color: Theme.of(context).buttonColor,
      child: _authState.authStatus == AuthStatus.Busy
          ? CircularProgressIndicator()
          : Text(AppLocalizations.of(context).btnSend),
      onPressed: _authState.authStatus == AuthStatus.Busy
          ? null
          : () => this._register(context),
    );
  }

  Widget _form(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      autovalidate: false,
      child: Column(children: <Widget>[
        _nameFiled(context),
        _emailFiled(context),
        _passwordFiled(context)
      ]),
    );
  }
}
