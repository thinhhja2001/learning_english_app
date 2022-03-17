import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  bool _isValid = true;

  bool get isValid => _isValid;

  void changeIsValidValue() {
    _isValid = !_isValid;
    notifyListeners();
  }
}
