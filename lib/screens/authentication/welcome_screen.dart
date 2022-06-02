import 'package:flutter/material.dart';
import 'package:learning_english_app/widgets/authentication/welcome/welcom_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WelcomeBody(),
      ),
    );
  }
}
