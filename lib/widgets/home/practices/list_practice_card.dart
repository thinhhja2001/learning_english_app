import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/utils/constants.dart';

import 'practice_card.dart';

class ListPracticeCard extends StatelessWidget {
  const ListPracticeCard(
      {Key? key, required this.practices, required this.practiceType})
      : super(key: key);
  final List<Practice> practices;
  final PracticeType practiceType;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PracticeCard(practice: practices[index]);
        },
        childCount: practices.length,
      ),
    );
  }
}
