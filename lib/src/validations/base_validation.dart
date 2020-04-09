import 'package:location/src/models/model.dart';
import 'package:location/src/models/models.dart';
import 'package:location/src/validations/errors_validation.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class BaseValidation<T extends BaseModel> {
  Map<String, FormError> _errors = {};

  Map<String, FormError> get errors => _errors;

  BehaviorSubject<Map<String, FormError>> _errorsController = BehaviorSubject();

  Stream get getErrors => _errorsController.stream;

  Function get addSingleError => _errorsController.sink.add;

  // factory BaseValidation._() => null;

  FormError getError(String field) {
    if (_errors.containsKey(field)) {
      return _errors[field];
    }
    return null;
  }

  void teStream() {
    var b = getErrors.listen((data) => print(data.toString()));
  }

  bool hasError(String feild) {
    if (_errors.containsKey(feild)) {
      return true;
    }
    return false;
  }

  // very usefule in show an error besed on user behaviour
  bool showError(String f) {
    // TODO: errors display logic
    return hasError(f);
  }

  /**
   * 
   *  validation 
   *  @fields include all fields that must be validated
   * this is very usefule to filter a form fields
   */
  Map<String, FormError> validate(User user, {List fields}) {
    var b = _getKeys(user);
    for (var f in fields) {
      if (b.contains(f)) {
        // check for values are valid
        // errors are added to errors list
        var e = this.check(f, user);
        // check error list
        print("validate item" + f.toString());
        if (e != null) {
          print(" item has errorx" + e.toString());
addError(key: e.key, message: e.message, code: e.code);
          return {e.key: e};
        }
        // print("ERROS" + _fErrors.toString());
      } else {
        //
        throw new FlutterError("$f field is missing");
      }
    }
    return null;
  }

  void addError({String message, String code, String key}) {
    FormError e = FormError(
      message: message != null ? message : "",
      code: code != null ? code : "",
      // key: key != null ? key : "",
    );
    this._errors[key] = e;
  }

  void _removeError(FormError e) {}
  FormError check(String field, User user) {
    return FormError(key: field, message: "Not goooos", code: "EmailNOTVALID");
  }

  Iterable<String> _getKeys(User user) {
    return user.toJson().keys;
  }

  void rest() {
    // remove all
  }
}
