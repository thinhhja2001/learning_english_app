import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = "Login success";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print(userCredential.user!.email);
      }
    } on FirebaseAuthException catch (e) {
      print("error return " + e.code);
      if (e.code == "user-not-found") {
        result = "No user found for that email";
      } else if (e.code == "wrong-password") {
        result = "Your password is incorrect";
      } else if (e.code == "invalid-email") {
        result = "Invalid email format";
      } else {
        result = "Some error occurred, please try again later";
      }
    }
    return result;
  }
}
