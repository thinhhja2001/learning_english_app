import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/signin_screen.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/draw_half_circle.dart';

class EmailVerifyScreen extends StatelessWidget {
  EmailVerifyScreen({Key? key}) : super(key: key);
  final User _user = FirebaseAuth.instance.currentUser!;
  String title = "Just one more step";
  String description =
      "We have sent a verification link to this email. Please check your email and confirm";
  String buttonContent = "Go to Login";
  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          child: ButtonTheme(
                            height: 39,
                            minWidth: 259,
                            child: ElevatedButton(
                                // onPressed: emailVerificationProvider.onSubmitClick,
                                onPressed: () {
                                  Get.to(SignInScreen());
                                },
                                child: new Text(
                                  buttonContent,
                                  style:
                                      ktsButton.copyWith(color: kcWhiteColor),
                                )),
                          ),
                        ),
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
