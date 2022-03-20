import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/resetpassword_provider.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/widgets/reset_password_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  final double heightCard;
  const ResetPasswordScreen({Key? key, required this.heightCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resetpasswordProvider = Provider.of<ResetPasswordProvider>(context);
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black])
                  .createShader(
                      Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
            },
            blendMode: BlendMode.darken,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/background.jpg"),
                      fit: BoxFit.fill)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Resetpasswordwidget(
                  resetPasswordProvider: resetpasswordProvider,
                  heightCard: heightCard,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController),
            ],
          )
        ],
      ),
    );
  }
}

class Resetpasswordwidget extends StatelessWidget {
  const Resetpasswordwidget(
      {Key? key,
      required TextEditingController passwordController,
      required TextEditingController confirmPasswordController,
      required ResetPasswordProvider resetPasswordProvider,
      required double heightCard})
      : _resetPasswordProvider = resetPasswordProvider,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _heightCard = heightCard,
        super(key: key);

  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final double _heightCard;
  final ResetPasswordProvider _resetPasswordProvider;

  @override
  Widget build(BuildContext context) {
    void changeToSuccessScreen() {
      Navigator.pushReplacementNamed(context, '/successpassword');
    }

    void changeToSignIn() {
      Navigator.pushReplacementNamed(context, '/signin');
    }

    void _isEnableButton() {
      final text = _passwordController.value.text;
      final compareText = _confirmPasswordController.value.text;

      if (text.isEmpty ||
          compareText.isEmpty ||
          text.length < 8 ||
          text.compareTo(compareText) != 0) {
      } else {
        changeToSuccessScreen();
      }
    }

    return SizedBox(
      width: double.infinity,
      height: _heightCard,
      child: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.05),
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
                    primary: kPrimaryColor,
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
}
