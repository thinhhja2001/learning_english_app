import 'package:flutter/cupertino.dart';
import 'package:learning_english_app/resources/auth_methods.dart';

class SignInProvider extends ChangeNotifier {
  bool _isValid = true;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isValid => _isValid;
  String _invalidError = "";
  String get invalidError => _invalidError;
  Future<String> loginUser(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      _isValid = false;
      _invalidError = "Please fill up all the field";
      notifyListeners();
      return _invalidError;
    }

    _isLoading = true;
    notifyListeners();

    _invalidError =
        await AuthMethods().loginUser(email: email, password: password);
    if (_invalidError == "Login success") {
      _isValid = true;
    } else {
      _isValid = false;
    }

    _isLoading = false;
    notifyListeners();
    return _invalidError;
  }

  void changeIsValidValue() {
    _isValid = !_isValid;
    notifyListeners();
  }
}
