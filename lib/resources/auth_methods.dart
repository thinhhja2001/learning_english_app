// ignore_for_file: unused_element, avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_english_app/models/user.dart' as model;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import "package:http/http.dart" as http;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _token;
  Future<model.UserData> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.UserData.fromSnap(snap);
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final url = 'https://identitytoolkit..com/v1/accounts:$urlSegment?key=""';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    print(responseData);
    _token = responseData['idToken'];
    print('************************' + _token.toString());
    try {
      if (urlSegment == "signUp") {
        sharedPreferences.setString("token", _token.toString());
      }
    } catch (e) {
      print(e);
    }
    print("true");
  }

  Future<void> changePassword(String newPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString("token")!;
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=""';
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'idToken': _token,
            'password': newPassword,
            'returnSecureToken': true,
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<String> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    String result = "Email not found";
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //add user to database
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'uid': userCredential.user!.uid,
        'email': email,
        'avatarURL': "",
        'timeUsed': 0
      });
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      await user?.sendEmailVerification();
      result = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = "Login success";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print(userCredential.user!.email);
      }
    } on FirebaseAuthException catch (e) {
      print("error return " + e.code);
      if (e.code == "user-not-found") {
        result = "No user found for that email";
      } else if (e.code == "wrong-password") {
        result = "Your password is incorrect";
      } else if (e.code == "invalid-email") {
        result = "Invalid email format";
      } else {
        result = "Some error occurred, please try again later";
      }
    }
    return result;
  }
}
