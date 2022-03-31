import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/providers/email_verify_provider.dart';
import 'package:learning_english_app/screens/signin_screen.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/draw_half_circle.dart';
// import 'package:learning_english_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class EmailVerifyScreen extends StatelessWidget {
  EmailVerifyScreen({Key? key}) : super(key: key);
  final User _user = FirebaseAuth.instance.currentUser!;
  String title = "Just one more step";
  String description =
      "We have sent a verification link to this email. Please check your email and confirm";
  String buttonContent = "Go to Login";
  @override
  Widget build(BuildContext context) {
    // final emailVerificationProvider = Provider.of<EmailVerifyProvider>(context);

    return Scaffold(
        backgroundColor: kcWhiteColor,
        body: SafeArea(
          child: CustomPaint(
            painter: MyPainter(),
            size: MediaQuery.of(context).size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MyArc(diameter: 300),
                IconButton(
                    //Back Button
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                verticalSpaceLarge,
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/images/Rating.svg"),
                        verticalSpaceMedium,
                        Text(
                          title,
                          style:
                              ktsMediumTitleText.copyWith(color: kcBlackColor),
                        ),
                        verticalSpaceTiny,
                        Text(
                          description,
                          style:
                              ktsMediumInputText.copyWith(color: kcBlackColor),
                        ),
                        verticalSpaceRegular,
                        Text(
                          _user.email!,
                          style: ktsMediumLabelInputText.copyWith(
                              color: kcBlackColor),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpaceLarge,
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          // child: CustomButton(
                          //     onPress: emailVerificationProvider.onSubmitClick,
                          //     content: emailVerificationProvider.buttonContent,
                          //     isLoading: emailVerificationProvider.isLoading),
                          child: ButtonTheme(
                            height: 39,
                            minWidth: 259,
                            child: ElevatedButton(
                                // onPressed: emailVerificationProvider.onSubmitClick,
                                onPressed: () {
                                  Get.to(const SignInScreen());
                                },
                                child: new Text(
                                  buttonContent,
                                  style:
                                      ktsButton.copyWith(color: kcWhiteColor),
                                )),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "You have an account?",
                        //       style: ktsAnotherFunction,
                        //     ),
                        //     TextButton(
                        //         onPressed: () {
                        //           Get.to(const SignInScreen());
                        //         },
                        //         child: Text(
                        //           "Login",
                        //           style: ktsAnotherFunction.copyWith(
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ))
                        //   ],
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
