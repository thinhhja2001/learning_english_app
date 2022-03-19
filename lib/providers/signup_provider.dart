import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpProcess extends ChangeNotifier {
  String? _Email, _Uid;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUserAccount(String email, String password) async {
    bool result = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        _Uid = userCredential.user!.uid;
        _Email = userCredential.user!.email;
        return result = true;
      }
    } catch (e) {}
    return result;
  }
}
