import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/signin_provider.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/widgets/custom_error_box.dart';
import 'package:learning_english_app/widgets/forget_password_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_input_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    void signIn() {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        signInProvider.changeIsValidValue();
      }
    }

    return Scaffold(
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
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/app_icon.png",
                            height: 100,
                            width: 100,
                          ),
                          const Text(
                            "ELAST",
                            style: TextStyle(color: Colors.white, fontSize: 80),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          CustomInputField(
                            customInputFieldType: CustomInputFieldType.text,
                            controller: _emailController,
                          ),
                          CustomInputField(
                              customInputFieldType:
                                  CustomInputFieldType.password,
                              controller: _passwordController),
                          signInProvider.isValid
                              ? Container()
                              : const CustomErrorBox(
                                  message: "Please fill up all the field"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => ForgetPassword(),
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(30.0),
                                            topRight:
                                                const Radius.circular(30.0)),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: signIn,
                                  child: const Text("Sign In"))),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Doesn't have an account yet?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Register here",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
