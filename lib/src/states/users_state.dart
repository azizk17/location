import 'package:location/src/models/models.dart';
import 'package:location/src/repository/repository.dart';
import 'package:location/src/states/base_state.dart';
import 'package:location/src/validations/errors_validation.dart';
import 'package:location/src/validations/validations.dart';
import 'package:flutter/material.dart';

class UsersState extends BaseState {
  UsersRepository _repo = UsersRepository();
  String name;
  String email;
  String phoneNumber;
  User get initData => _initData;
  User _initData;
  Map<String, FormError> _fErrors = {};
  Map<String, FormError> get fErrors => _fErrors;

  String item;
  String get errorText => _errorText;
  bool _error = false;
  String _errorText = null;

  UsersValidation validation = UsersValidation();

  get validate => validation.validate;
  get errors => validation.errors;

  void _setError(bool e) {
    _error = e;
  }

  void _setErrorText(String e) {
    _errorText = e;
    notifyListeners();
  }

  setInitData(User user) {
    _initData.toBuilder().replace(user);
    notifyListeners();
  }

  UsersState();
  Iterable<String> _getKeys(User user) {
    return user.toJson().keys;
  }

  update(User user) async {
    // validate isOnwer
    var u = await this._repo.update(user);
  }

  @override
  void reset() {
    // TODO: implement reset
    _setError(false);
    _setErrorText(null);
    super.reset();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
