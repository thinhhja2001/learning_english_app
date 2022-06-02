// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class AppBarFavoriteWordWidget extends StatelessWidget
    with PreferredSizeWidget {
  const AppBarFavoriteWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 60,
      titleSpacing: 0,
      leading: const BackButton(color: Colors.black),
      title: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              "assets/images/favorite_vocabulary.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            "Danh sách yêu thích",
            style: ktsBlackBigTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
