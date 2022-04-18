import 'package:flutter/material.dart';
import 'package:learning_english_app/resources/auth_methods.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  int? switchScreen;

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  Future<void> resetPassword(String newPassword) async {
    await AuthMethods().changePassword(newPassword);
  }

  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchScreen = 1;
  }

  Widget switchToAnotherScreen(BuildContext context) {
    if (switchScreen == 1) {
      return ResetPasswordModel(context);
    } else {
      return SuccessModel(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.7, child: switchToAnotherScreen(context));
  }

  Widget ResetPasswordModel(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Container(
                    child: Text(
                      "Please make sure your new password must be different from previous used passwords.",
                      style: TextStyle(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Password",
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 40, 1),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: screenSize.height * 0.1,
                child: TextFormField(
                  controller: passwordTextController,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    helperText: "Must be at least 8 characters.",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                        icon: Icon(
                          _isPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff9FA5C0),
                        )),
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return "Password is too short.";
                    } else {
                      return null;
                    }
                  },
                )),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Confirm Password",
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 40, 1),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: screenSize.height * 0.1,
                child: TextFormField(
                  controller: confirmPasswordTextController,
                  obscureText: _isConfirmPasswordObscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    helperText: "Both password must match.",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordObscure =
                                !_isConfirmPasswordObscure;
                          });
                        },
                        icon: Icon(
                          _isConfirmPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff9FA5C0),
                        )),
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.compareTo(passwordTextController.text) != 0) {
                      return "Confirm Password does not match";
                    } else {
                      return null;
                    }
                  },
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Container(
              width: screenSize.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isloading = true;
                  });
                  if (formKey.currentState!.validate()) {
                    resetPassword(passwordTextController.text);
                    setState(() {
                      _isloading = false;
                      switchScreen = 2;
                    });
                  }
                },
                child: _isloading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SuccessModel(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "Password Reset Successful",
                      style: TextStyle(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Awesome! You’ve successfully updated your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Go back to Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
