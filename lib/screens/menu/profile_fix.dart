// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_app/models/user.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/pratice/user_provider.dart';
import '../../widgets/menu/profile_pic.dart';

class FixProfile extends StatefulWidget {
  const FixProfile({Key? key, required this.user}) : super(key: key);

  final UserData user;
  @override
  State<FixProfile> createState() => _FixProfileState();
}

class _FixProfileState extends State<FixProfile> {
  TextEditingController? _controller;
  File? image;
  String? imageURL;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.user.name);
    imageURL = widget.user.avatarURL;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        title: const Text('Change information',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kcBlackColor)),
        backgroundColor: kcWhiteColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                try {
                  FirebaseHandler()
                      .setUserProfile(userProvider.user, image,
                          _controller!.text.toString(), imageURL!)
                      .then((value) {
                    userProvider.getCurrentUser().then((value) => Get.back());
                  });
                }
                // ignore: empty_catches
                on FirebaseAuthException catch (e) {
                  print('Failed with error code: ${e.code}');
                  print(e.message);
                }

              },
              child: const Text(
                "Save",
                style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          height: 20,
        ),
        ProfilePic(
          avatarUrl: widget.user.avatarURL,
          imagePicker: image,
        ),
        TextButton(
            onPressed: () {
              pickImage().then((value) => (setState(() {})));
            },
            child: const Text(
              "Change your avatar",
              style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: _controller,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: kcBlackColor),
            decoration: const InputDecoration(),
          ),
        ),
      ]),
    );
  }
}
