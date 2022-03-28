import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SuccessResetScreen extends StatelessWidget {
  const SuccessResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SuccessPasswordWidget(),
        ],
      ),
    );
  }
}

class SuccessPasswordWidget extends StatelessWidget {
  const SuccessPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      primary: kPrimaryColor,
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
}
