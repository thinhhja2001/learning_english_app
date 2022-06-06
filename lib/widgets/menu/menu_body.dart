import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/user.dart';
import 'package:learning_english_app/resources/auth_methods.dart';
import 'package:learning_english_app/screens/menu/profile_fix.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/menu/menu_part.dart';
import 'package:learning_english_app/widgets/menu/profile_pic.dart';

import '../../screens/authentication/welcome_screen.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key, required this.user}) : super(key: key);
  final UserData user;

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  // ignore: non_constant_identifier_names
  void ChangeInformation(UserData user) {
    Get.to(FixProfile(user: user));
  }

  // ignore: non_constant_identifier_names
  void Logout() async {
    await AuthMethods().signOut().then((value) {
      Get.offAll(const WelcomeScreen());
    });

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          ProfilePic(
            avatarUrl: widget.user.avatarURL,
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Text(
            widget.user.name,
            style: ktsBoldText,
          ),
          Text(
            widget.user.email,
            style: ktsBoldText,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => ChangeInformation(widget.user),
            child: const MenuPart(
              title: "Change your information",
              icon: Icons.person,
            ),
          ),
          InkWell(
            onTap: () => Logout(),
            child: const MenuPart(
              title: "Logout",
              icon: Icons.logout,
              
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
