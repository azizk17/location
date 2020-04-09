import 'package:location/src/app/enums/users_enum.dart';
import 'package:location/src/locale.dart';
import 'package:location/src/models/models.dart';
import 'package:location/src/states/auth_state.dart';
import 'package:location/src/ui/screens/users/edit_filed.dart';
import 'package:location/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class EmailEditScreen extends FormEditingLayout {
//   var data = User();
//   User d = User();
//   // final GlobalKey<FormFieldState<String>> emailKey =
//   //     new GlobalKey<FormFieldState<String>>();
//   TextEditingController _emailController;

//   @override
//   get getfeilds => (BuildContext context) {
//         var auth = Provider.of<AuthState>(context);
//         _emailController = TextEditingController(text: auth.authUser.email);

//         return [
//           EmailFormField(
//             controller: _emailController,
//           ),
//         ];
//       };
//   get title =>
//       (BuildContext context) => '${AppLocalizations.of(context).email}';

//   String get message => "Message abount someting";
//   // String get note => "Note about someting";

//   get onSubmit => (BuildContext context) async {
//         var auth = Provider.of<AuthState>(context);
//         User u = User().rebuild((b) => b..email = _emailController.text);
//         this.save();
//         if (this.validate()) {
//           var b = await auth.update(id: auth.authUser.id, user: u);
//           if (b is AuthError) {
//             this.setErrors("ERROR not auth");
//           }
//         }

//         print(_emailController.text);
//       };
// }

class EmailEditScreen extends StatelessWidget {
  final _emailController = TextEditingController(text: '');
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return FormEditingLayout(
      title: Text("adsd"),
      formKey: _formKey,
      onSubmit: () {
        _formKey.currentState.save();
        _formKey.currentState.validate();
      },
      fields: <Widget>[
        EmailFormField(
          controller: _emailController,
        ),
      ],
      errors: "sd sd",
      // onCancel: () => print("object"),
    );
  }
}

// Name editing screen
class NameEditScreen extends StatelessWidget {
  final _nameController = TextEditingController(text: '');
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthState>(context);
    return FormEditingLayout(
      title: Text(AppLocalizations.of(context).name),
      formKey: _formKey,
      enabled: true,
      onSubmit: () async {
        _formKey.currentState.save();
        if (_formKey.currentState.validate()) {
          User user = User().rebuild((b) => b..name = _nameController.text);
          User be = User().rebuild((b) => [b..name = _nameController.text, b..email = "sdsdsds"]);
          if (user == be) {
            print("USERs are good");
          }
          print("USER: " + user.toString() + " Be: " + be.toString());

          await auth.update(user: user);
        }
      },
      fields: <Widget>[
        NameInput(
          controller: _nameController,
        ),
      ],
      errors: "sd sd",
      // onCancel: () => print("object"),
    );
  }
}
