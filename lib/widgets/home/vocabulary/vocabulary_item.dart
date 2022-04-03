import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/vocabulary/vocabulary_detailedlist_screen.dart';
import '../../../utils/styles.dart';

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
