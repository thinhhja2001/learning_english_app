import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpProvider extends ChangeNotifier {
  // String? _Email, _Uid;

  // FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<bool> CreateUserAccount(String email, String password) async {
  //   bool result = false;
  //   try {
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     if (userCredential != null) {
  //       _Uid = userCredential.user!.uid;
  //       _Email = userCredential.user!.email;
  //       return result = true;
  //     }
  //   } catch (e) {}
  //   return result;
  // }

  bool _isValidEmail = true;
  get isValidEmail => this._isValidEmail;
  set isValidEmail(value) {
    this._isValidEmail = value;
    notifyListeners();
  }

  bool _isValidPassword = true;
  get isValidPassword => this._isValidPassword;
  set isValidPassword(value) {
    this._isValidPassword = value;
    notifyListeners();
  }

  bool _isMatch = true;
  bool get isMatch => this._isMatch;
  set isMatch(bool value) => this._isMatch = value;
  //0. First Name
  //1. Second Name
  //2. Mobile Phone
  //3. Email
  List<bool> _isEmptyField = new List.filled(4, false);
  List<bool> get isEmptyField => this._isEmptyField;
  set isEmptyField(List<bool> value) => this._isEmptyField = value;

  void isEmpty(String isEmpty) {
    //0. First Name
    //1. Second Name
    //2. Mobile Phone
    //3. Email
    List<bool> isEmptyCheckField = new List.filled(4, true);
    for (int i = 0; i < isEmpty.length; i++) {
      if (isEmpty[i] == "1")
        isEmptyCheckField[i] = true;
      else
        isEmptyCheckField[i] = false;
    }
    isEmptyField = isEmptyCheckField;
    notifyListeners();
  }

  void changeIsValidValue() {
    // _isValid = !_isValid;
    notifyListeners();
  }

  void checkConfirm(String password, String confirmPassword) {
    isMatch = password == confirmPassword;
    notifyListeners();
  }
}
