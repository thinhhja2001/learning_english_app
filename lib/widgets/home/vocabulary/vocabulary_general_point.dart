import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class VocabularyGenralPoint extends StatelessWidget {
  const VocabularyGenralPoint({
    Key? key,
    required this.pointText,
    required this.reviewText,
  }) : super(key: key);

  final String pointText;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.blue,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              pointText,
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
              reviewText,
              style: TextStyle(
                  fontSize: h6,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            )
          ],
        ),
      ),
    );
  }
}
