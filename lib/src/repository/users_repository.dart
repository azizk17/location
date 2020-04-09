import 'package:location/src/models/models.dart';
import 'package:flutter/services.dart';

import '../services/firebase/users_firebase.dart';
import '../services/firebase/auth_firebase.dart';


class UsersRepository {
  final UsersFirebase _usersService = UsersFirebase();
   getUserByID(String id) {
     
  }
  save(User user) {
    return this._usersService.save(user);
  }
  update(User user) {}
}
