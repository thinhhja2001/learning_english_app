import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/authentication/signin_screen.dart';

class EmailVerifyProvider extends ChangeNotifier {
  bool _isLoading = false;
  final User _user = FirebaseAuth.instance.currentUser!;

  /// _currentState represent for current state of the screen.
  /// It is "false" if current state is when the user haven't click the send email button yet,
  /// and it will is "true" if the user clicked the send email button
  bool _currentState = false;
  get currentState => _currentState;
  get isLoading => _isLoading;
  String title = "Just one more step";
  String description =
      "We have sent a verification link to this email. Please check your email and confirm";
  String buttonContent = "Go to Login";
  void setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  void onSubmitClick() async {
    // //User haven't clicked the send email button yet
    // if (_currentState == false) {
    //   await sendEmailVerification();
    //   changeCurrentState();
    // } else {
    //   Get.to(const SignInScreen());
    // }
    Get.to(SignInScreen());
  }

  Future<String> sendEmailVerification() async {
    if (!_user.emailVerified) {
      setIsLoading(true);
      await _user.sendEmailVerification();
      setIsLoading(false);
      Get.snackbar("Email sent", "An email has been sent to ${_user.email}");
      return "success";
    }
    return "failed";
  }
}
