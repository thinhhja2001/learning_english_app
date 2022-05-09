// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/list_quiz_question.dart';
import 'package:learning_english_app/providers/authentication/email_verify_provider.dart';
import 'package:learning_english_app/providers/pratice/dialog_quiz_controller.dart';
import 'package:learning_english_app/providers/pratice/loading_provider.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:learning_english_app/firebase_options.dart';
import 'package:learning_english_app/providers/authentication/signin_provider.dart';
import 'package:learning_english_app/providers/pratice/user_provider.dart';
import 'package:learning_english_app/providers/reading_provider.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/screens/authentication/signin_screen.dart';
import 'package:learning_english_app/providers/authentication/signup_provider.dart';
import 'package:learning_english_app/screens/home/home_screen.dart';
import 'package:learning_english_app/widgets/home/practices/custom_radio.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<EmailVerifyProvider>(
            create: (context) => EmailVerifyProvider()),
        ChangeNotifierProvider<ReadingProvider>(
            create: (context) => ReadingProvider()),
        ChangeNotifierProvider<PageQuizProvider>(
            create: (context) => PageQuizProvider()),
        ChangeNotifierProvider<DialogQuizProvider>(
            create: (context) => DialogQuizProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider()),
        // StreamProvider<ListQuizQuestion>(
        //     create: (context) => , initialData: ListQuizQuestion())
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.blue,
          ),
          home: FirebaseAuth.instance.currentUser == null
              ? SignInScreen()
              : HomeScreen(),
          routes: <String, WidgetBuilder>{
            '/signin': (BuildContext context) => SignInScreen(),
          }),
    );
  }
}
