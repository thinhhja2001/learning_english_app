import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

// ignore: must_be_immutable
class VocabularyGenralPoint extends StatelessWidget {
  VocabularyGenralPoint(
      {Key? key, required this.totalWord, required this.totalWordLearned})
      : super(key: key);

  late int totalWordLearned;
  late int totalWord;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 4),
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.blue,
            ),
            const SizedBox(width: 2),
            Text(
              "$totalWordLearned / $totalWord learned",
              style: ktsMiniDescription,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
