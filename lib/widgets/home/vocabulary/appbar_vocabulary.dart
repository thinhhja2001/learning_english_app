import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

// ignore: must_be_immutable
class AppBarVocabularyList extends StatelessWidget with PreferredSizeWidget {
  AppBarVocabularyList({
    required this.imageSource,
    required this.title,
    required this.totalWord,
    Key? key,
  }) : super(key: key);

  late String imageSource;
  late int totalWord;
  late String title;

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
            child: Image.network(
              imageSource,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  title,
                  style: ktsBlackBigTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    " $totalWord words",
                    style: ktsMiniDescription,
                  ),
                  const SizedBox(width: 16),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
