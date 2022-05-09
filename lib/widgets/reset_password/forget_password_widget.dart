import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  int? switchScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchScreen = 1;
  }

  Widget switchToAnotherScreen(BuildContext context) {
    if (switchScreen == 1) {
      return forgetPassword(context);
    } else {
      return CheckEmail(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.7, child: switchToAnotherScreen(context));
  }

  Widget forgetPassword(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final TextEditingController _email = TextEditingController();
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
                      "Forgot Password",
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
                      "Enter the email associated with your account and we’ll send an email instruction to reset your password.",
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
              "Email Address",
              style: TextStyle(
                color: Color.fromRGBO(143, 143, 143, 1),
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
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      return "Email invalidated";
                    } else {
                      return null;
                    }
                  },
                )),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Container(
              width: screenSize.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    auth.sendPasswordResetEmail(email: _email.text);
                    setState(() {
                      switchScreen = 2;
                    });
                  }
                },
                child: Text(
                  "Send Instruction",
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

  Widget CheckEmail(BuildContext context) {
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
                      "Check your Email",
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
                      "We have sent a password revocery instruction to your registered email.",
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
                  onPressed: () {},
                  child: Text(
                    "Open Email App",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Nah, I'll check it later",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Did not receive the email? Check your spam folder or",
                style: TextStyle(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              Container(
  
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      switchScreen = 1;
                    });
                  },
                  child: Text(
                    "try another email address",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
