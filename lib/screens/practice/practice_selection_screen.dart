import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice_file.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../models/practice.dart';
import '../../widgets/home/practices/practice_selection_card.dart';

class PracticeSelectionScreen extends StatelessWidget {
  const PracticeSelectionScreen({Key? key, required this.practice})
      : super(key: key);
  final Practice practice;
  Color getTitleColor(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return Colors.purple;
    } else if (practiceType == PracticeType.reading) {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.teal;

    final Color titleColor = getTitleColor(practice.practiceType);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              practicePartName[practice.practicePart.index],
              style: kDefaultTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              practicePartTitle[practice.practicePart.index],
              style: kDefaultTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: titleColor),
            )
          ],
        ),
        backgroundColor: kcWhiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 01')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 02')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 03')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 04')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 05')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 06')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 07')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 08')),
              PracticeSelectionCard(
                  practiceFile: PracticeFile(
                      fileQuestionCount:
                          practiceTotalQuestion[practice.practicePart.index],
                      fileSize: 5.9,
                      fileTakeFrom: 'ETS 2019',
                      practice: practice,
                      fileTitle:
                          '${practicePartShortTitle[practice.practicePart.index]} 09')),
            ],
          ),
        ),
      ),
    );
  }
}
