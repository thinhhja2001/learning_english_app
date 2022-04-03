import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class AppBarVocabularyList extends StatelessWidget with PreferredSizeWidget {
  const AppBarVocabularyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 60,
      titleSpacing: 0,
      leading: BackButton(color: Colors.black),
      title: Container(
          child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/images/toeic_image.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "600 từ vựng TOEIC",
                style: TextStyle(
                    fontSize: h3,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Roboto"),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "596/596 learned",
                    style: TextStyle(
                        fontSize: h6,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.timelapse,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "200 need review",
                    style: TextStyle(
                        fontSize: h6,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  )
                ],
              )
            ],
          )
        ]),
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
