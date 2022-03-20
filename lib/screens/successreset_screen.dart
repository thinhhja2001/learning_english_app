import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SuccessResetScreen extends StatelessWidget {
  final double heightCard;
  const SuccessResetScreen({Key? key, required this.heightCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SuccessPasswordWidget(
                heightCard: heightCard,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SuccessPasswordWidget extends StatelessWidget {
  const SuccessPasswordWidget({
    required double heightCard,
    Key? key,
  })  : _heightCard = heightCard,
        super(key: key);

  final double _heightCard;

  @override
  Widget build(BuildContext context) {
    void changeToSignIn() {
      Navigator.pushReplacementNamed(context, '/signin');
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  const Expanded(
                    flex: 8,
                    child: Text(
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
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: changeToSignIn,
                      icon: const Icon(Icons.close),
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
                padding: const EdgeInsets.only(top: 32),
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
