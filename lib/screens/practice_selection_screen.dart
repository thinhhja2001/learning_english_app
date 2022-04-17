import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../widgets/home/practices/practice_selection_card.dart';

class PracticeSelectionScreen extends StatelessWidget {
  const PracticeSelectionScreen({Key? key, required this.practiceType})
      : super(key: key);
  final PracticeType practiceType;
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

    final Color titleColor = getTitleColor(practiceType);
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
              "Part 1",
              style: kDefaultTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              "Photograph",
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
