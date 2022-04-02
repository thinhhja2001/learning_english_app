import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  late String _token;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final url =
        'https://identitytoolkit..com/v1/accounts:$urlSegment?key="AIzaSyCHL8W3koZiGQkMUwId-tLJ5s5Lxnwjfek"';
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
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key="AIzaSyCHL8W3koZiGQkMUwId-tLJ5s5Lxnwjfek"';
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
}
