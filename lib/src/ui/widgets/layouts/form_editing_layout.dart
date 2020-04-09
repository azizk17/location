import 'package:location/src/locale.dart';
import 'package:location/src/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:location/src/ui/widgets/layouts/default_layout.dart';

/**
 * # Form Editing Layout 
 * This layout is used by extend it
 */
class FormEditingLayout extends StatelessWidget {
  Function onSubmit;
  Function onCancel;
  List<Widget> _feilds;
  final bool enabled;
  final bool loading;

  String _title;
  String _errors;
  String _message;
  String _note;
  dynamic data;

  final List<Widget> fields;
  final Widget title;
  final errors;
  final GlobalKey<FormState> formKey;

  get getfeilds => _feilds;
  get note => _note;

  void setErrors(String e) {
    _errors = e;
  }

  void save() {
    formKey.currentState.save();
  }

  bool validate() {
    return formKey.currentState.validate();
  }

  void getValue() {}

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FormEditingLayout({
    this.title = const Text("Dfdfdfd"),
    this.errors,
    this.fields,
    this.onSubmit,
    this.onCancel,
    this.formKey, 
    this.enabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    // build feilds list which required context object
    // getfeilds(context);
    return DefalutLayout(
      padding: EdgeInsets.only(left: 15, right: 15),
      title: this.title,
      content: Container(
        color: Colors.lightBlue,
        child: new Form(
          key: this.formKey != null ? this.formKey : _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...this.fields.map((f) {
                return Container(
                  child: f,
                  padding: EdgeInsets.only(bottom: 10),
                );
              }),
              // note
              Container(
                // ? notice text start with space
                child: Text('   ${this.note}'),
              ),
              // Actions
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Btn(
                    child: Text(AppLocalizations.of(context).btnSave),
                    color: Colors.green,
                    enabled: this.enabled,
                    loading: this.loading,
                    onPressed: this.onSubmit,
                  ),
                  SizedBox(width: 30),
                  Btn(
                    child: Text(
                      AppLocalizations.of(context).btnCancel,
                      style: TextStyle(color: Colors.black38),
                    ),
                    color: Colors.transparent,
                    onPressed: this.onCancel != null
                        ? this.onCancel
                        : () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
