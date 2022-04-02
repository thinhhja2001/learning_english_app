// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/vocabulary/vocabulary_detailedlist_screen.dart';

import '../../utils/styles.dart';

class VocabularyListScreen extends StatefulWidget {
  const VocabularyListScreen({Key? key}) : super(key: key);

  @override
  _VocabularyListState createState() => _VocabularyListState();
}

class _VocabularyListState extends State<VocabularyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarVocabularyList(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
              ],
            ),
          )),
        ),
        floatingActionButton: Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Row(
                children: [
                  Icon(Icons.fiber_new_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "Learn new words",
                    style: ktsWhiteTitle,
                  ),
                ],
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            )));
  }
}

class VocabularyItem extends StatelessWidget {
  const VocabularyItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            Get.to(VocabularyDetailedListScreen());
          },
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: ExactAssetImage('assets/images/toeic_image.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.green.shade200,
                width: 6.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Hợp đồng',
          style: TextStyle(
              fontSize: h4,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: "Roboto"),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              "596/596",
              style: TextStyle(
                  fontSize: h6,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.timelapse,
              color: Colors.blue,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "200",
              style: TextStyle(
                  fontSize: h6,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            )
          ],
        ),
        SizedBox(
          height: 32,
        ),
      ]),
    );
  }
}

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
