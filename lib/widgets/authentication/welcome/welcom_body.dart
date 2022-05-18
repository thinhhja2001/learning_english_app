// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/authentication/signup_screen.dart';
import 'package:learning_english_app/utils/colors.dart';

import '../../../screens/authentication/signin_screen.dart';
import '../../rounded_button.dart';
import 'background.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "WELCOME TO ELAST",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 28),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Image.asset('assets/images/owl.png'),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            text: "LOGIN",
            press: () => Get.to(SignInScreen()),
          ),
          RoundedButton(
            text: "SIGN UP",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () => Get.to(const SignUpScreen()),
          )
        ],
      ),
    );
  }
}
