import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/widgets/home/practices/appbar_practise.dart';

import '../../utils/colors.dart';
import '../../widgets/home/practices/practice_selection_card.dart';

class PractisePart2 extends StatelessWidget {
  const PractisePart2({Key? key, required this.partLink}) : super(key: key);
  final String partLink;

  String getTitle(String partLink) {
    switch (partLink) {
      case "part1":
        return "Part 1";
      case "part2":
        return "Part 2";
      case "part3":
        return "Part 3";
      case "part4":
        return "Part 4";
      case "part5":
        return "Part 5";
      case "part6":
        return "Part 6";
      case "part7":
        return "Part 7";
      default:
        return "";
    }
  }

  String getPartName(String partLink) {
    switch (partLink) {
      case "part1":
        return listenings[0].name;
      case "part2":
        return listenings[1].name;
      case "part3":
        return listenings[2].name;
      case "part4":
        return listenings[3].name;
      case "part5":
        return readings[0].name;
      case "part6":
        return readings[1].name;
      case "part7":
        return readings[2].name;
      default:
        return "";
    }
  }

  PracticeType getPracticeType(String partLink) {
    switch (partLink) {
      case "part1":
      case "part2":
      case "part3":
      case "part4":
        return PracticeType.listening;
      case "part5":
      case "part6":
      case "part7":
        return PracticeType.reading;
      default:
        return PracticeType.test;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.teal;
    String title = getTitle(partLink);
    String partName = getPartName(partLink);
    PracticeType practiceType = getPracticeType(partLink);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBarPractisePart(
        title: title,
        partName: partName,
        practiceType: practiceType,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              ),
              PracticeSelectionCard(
                questionCount: 6,
                size: 8.7,
                takenFrom: 'ETS 2019',
                title: 'Photograph 01',
              )
            ],
          ),
        ),
      ),
    );
  }
}
