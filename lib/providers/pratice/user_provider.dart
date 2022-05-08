import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  Future<void> getCurrentUser() async =>
      await AuthMethods().getUserDetails().then((data) {
        _user = User(email: data.email, name: data.name, uid: data.uid);
      });
}
