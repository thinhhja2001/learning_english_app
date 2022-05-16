import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  late UserData _user;
  UserData get user => _user;

  Future<void> getCurrentUser() async =>
      await AuthMethods().getUserDetails().then((data) {
        _user = UserData(
          email: data.email,
          name: data.name,
          uid: data.uid,
        );
      });
}
