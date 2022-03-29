import 'package:flutter/material.dart';

import '../providers/resetpassword_provider.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';


class GeneralResetScreen extends StatefulWidget {
  const GeneralResetScreen({ Key? key }) : super(key: key);

  @override
  State<GeneralResetScreen> createState() => _GeneralResetScreenState();
}

class _GeneralResetScreenState extends State<GeneralResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class ResetPassword extends StatefulWidget {
   final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final ResetPasswordProvider _resetPasswordProvider;
  const ResetPassword(
      {Key? key,
      required TextEditingController passwordController,
      required TextEditingController confirmPasswordController,
      required ResetPasswordProvider resetPasswordProvider})
      : _resetPasswordProvider = resetPasswordProvider,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        super(key: key);
    
 

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  @override
  Widget build(BuildContext context) {
      void changeToSuccess(){
      
    }

    void changeToSignIn() {
      Navigator.pop(context);
    }

    void _isEnableButton() {
      final text = widget._passwordController.value.text;
      final compareText = widget._confirmPasswordController.value.text;

      if (text.isEmpty ||
          compareText.isEmpty ||
          text.length < 8 ||
          text.compareTo(compareText) != 0) {
      } else {
        
      }
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
                passwordTextController: widget._passwordController,
                confirmPasswordTextController: widget._confirmPasswordController,
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


class ResetPasswordWidget extends StatefulWidget {
  final TextEditingController passwordTextController;
  final TextEditingController confirmPasswordTextController;
  final void doTaskResetPassword;
  const ResetPasswordWidget(
      {Key? key,
      required this.passwordTextController,
      required this.confirmPasswordTextController,
      this.doTaskResetPassword})
      : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    widget.passwordTextController.dispose();
    widget.confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Password",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1,
              letterSpacing: -0.025),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: (_) => setState(() {}),
          controller: widget.passwordTextController,
          obscureText: _isPasswordObscure,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            errorText: _errorPasswordText,
            helperText: "Must be at least 8 characters.",
            helperStyle: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1,
                letterSpacing: -0.025),
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordObscure = !_isPasswordObscure;
                  });
                },
                icon: Icon(
                  _isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff9FA5C0),
                )),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Confirm Password",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1,
              letterSpacing: -0.025),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: (_) => setState(() {}),
          controller: widget.confirmPasswordTextController,
          obscureText: _isConfirmPasswordObscure,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            errorText: _errorConfirmPasswordText,
            helperText: "Both password must match.",
            helperStyle: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1,
                letterSpacing: -0.025),
            hintText: 'Confirm Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                  });
                },
                icon: Icon(
                  _isConfirmPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color(0xff9FA5C0),
                )),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  String? get _errorPasswordText {
    // at any time, we can get the text from _controller.value.text
    final text = widget.passwordTextController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Password can\'t be empty';
    }
    if (text.length < 8) {
      return 'Password is too short';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorConfirmPasswordText {
    // at any time, we can get the text from _controller.value.text
    final text = widget.confirmPasswordTextController.value.text;
    final compareText = widget.passwordTextController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Confirm Password can\'t be empty';
    }
    if (text.compareTo(compareText) != 0 || compareText.length < 8) {
      return 'Confirm Password does not match';
    }
    // return null if the text is valid
    return null;
  }
}
