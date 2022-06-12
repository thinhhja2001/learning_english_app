import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/user.dart';
import 'package:learning_english_app/providers/pratice/user_provider.dart';
import 'package:learning_english_app/widgets/menu/menu_body.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);


  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  File? image;
  UserData? user;

  // void AfterSave() {
    
  // }
  @override
  Widget build(BuildContext context) {
     final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: ktsTitleAppBar,
        ),
        backgroundColor: kcWhiteColor,
        automaticallyImplyLeading: false,
      ),
      body: MenuBody(user: userProvider.user)
    );
  }
}
