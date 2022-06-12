import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.avatarUrl,
    this.imagePicker,
  }) : super(key: key);

  final String avatarUrl;
  final File? imagePicker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          imagePicker != null
              ? CircleAvatar(
                  child: Image.file(imagePicker!),
                )
              : avatarUrl == ""
                  ? const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage("assets/images/default_avatar.jpg"),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
        ],
      ),
    );
  }
}
