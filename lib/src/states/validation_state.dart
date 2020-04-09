import 'package:location/src/models/model.dart';
import 'package:location/src/validations/errors_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/model.dart';

class ValidationState<T extends BaseModel> extends ChangeNotifier {
  String _initData;

  get data => _initData;

  setData(String d) {
    _initData = d;
    notifyListeners();
  }


  // Map<String, FormError> _errors;

  // Map<String, FormError> errors;

  // // factory BaseValidation._() => null;

  // FormError getError(String field) {
  //   if (_errors.containsKey(field)) {
  //     return _errors[field];
  //   }
  //   return null;
  // }

  // bool hasError(String feild) {
  //   if (_errors.containsKey(feild)) {
  //     return true;
  //   }
  //   return false;
  // }

  // // very usefule in show an error besed on user behaviour
  // bool showError(String f) {
  //   // TODO: errors display logic
  //   return hasError(f);
  // }

  // /**
  //  * 
  //  *  validation 
  //  *  @fields include all fields that must be validated
  //  * this is very usefule to filter a form fields
  //  */
  // Map<String, FormError> validate(BaseModel model, {List fields}) {
  //   var b = _getKeys(model);
  //   for (var f in fields) {
  //     if (b.contains(f)) {
  //       // check for values are valid
  //       // errors are added to errors list
  //       this.check(f, model);
  //       // check error list

  //       // print("ERROS" + _fErrors.toString());
  //     } else {
  //       //
  //       throw new FlutterError("$f field is missing");
  //     }
  //   }
  //   if (this._errors != null) {
  //     return this._errors;
  //   }
  //   return null;
  // }

  // void addError({String message, String code, String key}) {
  //   FormError e = FormError(
  //     message: message != null ? message : "",
  //     code: code != null ? code : "",
  //     // key: key != null ? key : "",
  //   );
  //   this._errors[key] = e;
  // }

  // void _removeError(FormError e) {}
  // void check(String field, BaseModel model) {}

  // Iterable<String> _getKeys(BaseModel model) {
  //   return model.toJson().keys;
  // }
}
