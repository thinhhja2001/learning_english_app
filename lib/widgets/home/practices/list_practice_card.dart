import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/utils/constants.dart';

import 'practice_card.dart';

class ListPracticeCard extends StatelessWidget {
  const ListPracticeCard({
    Key? key,
    required this.practiceType,
    required this.practices,
  }) : super(key: key);
  final PracticeType practiceType;
  final List<Practice> practices;
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
          return PracticeCard(
              practiceType: practiceType,
              practiceName: practices[index].name,
              icon: IconData(int.parse('0x${practices[index].iconData}'),
                  fontFamily: 'MaterialIcons'),
              part: "Part ${index + 1}");
        },
        childCount: practices.length,
      ),
    );
  }
}
