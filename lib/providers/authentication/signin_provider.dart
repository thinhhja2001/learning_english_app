import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/resources/auth_methods.dart';
import 'package:learning_english_app/screens/home/home_screen.dart';

import '../../models/user.dart' as model;

class SignInProvider extends ChangeNotifier {
  bool _isValid = true;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isValid => _isValid;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  late model.UserData currentUser;

  Future<String> loginUser(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      _isValid = false;
      _errorMessage = "Please fill up all the field";
      notifyListeners();
      return _errorMessage;
    }

    _isLoading = true;
    notifyListeners();

    _errorMessage =
        await AuthMethods().loginUser(email: email, password: password);
    if (_errorMessage == "Login success") {
      _isValid = true;
      currentUser = await AuthMethods().getUserDetails();
      Get.to(const HomeScreen());
    } else {
      _isValid = false;
    }

    _isLoading = false;
    notifyListeners();
    return _errorMessage;
  }

  void changeIsValidValue() {
    _isValid = !_isValid;
    notifyListeners();
  }
}
