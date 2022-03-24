import 'package:flutter/cupertino.dart';

class ResetPasswordProvider extends ChangeNotifier {
  bool _isValid = true;

  bool get isValid => _isValid;

  void changeIsValidValue() {
    _isValid = !_isValid;
    notifyListeners();
  }
}
