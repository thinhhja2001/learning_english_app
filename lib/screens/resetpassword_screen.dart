import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/resetpassword_provider.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/widgets/reset_password_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? switchScreen;
    final resetpasswordProvider = Provider.of<ResetPasswordProvider>(context);
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    Widget switchToAnotherScreen(BuildContext context) {
      if (switchScreen == 1) {
        return Resetpasswordwidget(
            resetPasswordProvider: resetpasswordProvider,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController);
      } else {
        return SuccessScreen(context);
      }
    }

    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Resetpasswordwidget(
              resetPasswordProvider: resetpasswordProvider,
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController),
        ],
      ),
    );
  }
}

class Resetpasswordwidget extends StatefulWidget {
  const Resetpasswordwidget(
      {Key? key,
      required TextEditingController passwordController,
      required TextEditingController confirmPasswordController,
      required ResetPasswordProvider resetPasswordProvider})
      : _resetPasswordProvider = resetPasswordProvider,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        super(key: key);

  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final ResetPasswordProvider _resetPasswordProvider;

  Widget build(BuildContext context) {
    void changeToSuccess() {}

    void changeToSignIn() {
      Navigator.pop(context);
    }

    void _isEnableButton() {
      final text = _passwordController.value.text;
      final compareText = _confirmPasswordController.value.text;

      if (text.isEmpty ||
          compareText.isEmpty ||
          text.length < 8 ||
          text.compareTo(compareText) != 0) {
      } else {}
    }

    return SizedBox(
      width: double.infinity,
      child: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 9,
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: 2,
                          letterSpacing: -0.025),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: changeToSignIn,
                          icon: const Icon(Icons.close))),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Text(
                    "Please make sure your new password must be different from previous used passwords.",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.5)),
              ),
              const SizedBox(
                height: 12,
              ),
              ResetPasswordWidget(
                passwordTextController: _passwordController,
                confirmPasswordTextController: _confirmPasswordController,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kcPrimaryColor,
                    onPrimary: Colors.white,
                  ),
                  onPressed: _isEnableButton,
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: -0.025),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

Widget SuccessScreen(BuildContext context) {
  void changeToSignIn() {
    Navigator.pop(context);
  }

  return SizedBox(
    width: double.infinity,
    child: SafeArea(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: const Text(
                      "Password Reset\nSuccessful",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: 1,
                          letterSpacing: -0.025),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: IconButton(
                      onPressed: changeToSignIn,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  "Awesome! You’ve successfully updated your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1,
                      letterSpacing: -0.025),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kcPrimaryColor,
                    onPrimary: Colors.white,
                  ),
                  onPressed: changeToSignIn,
                  child: const Text(
                    'Go back to Sign in',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: -0.025),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )),
  );
}
