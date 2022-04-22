import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice_file.dart';
import 'package:learning_english_app/screens/practice/listening_test_screen.dart';
import 'package:learning_english_app/screens/practice/page_quiz_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/pratice/page_quiz_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class PracticeSelectionCard extends StatelessWidget {
  const PracticeSelectionCard({
    Key? key,
    required this.practiceFile,
  }) : super(key: key);

  final Color primaryColor = Colors.teal;
  final PracticeFile practiceFile;

  pressItem(PageQuizProvider pageQuizProvider, PracticeFile practiceFile) {
    pageQuizProvider.updatePractice(practiceFile);
    Get.to(PageQuizScreen());
  }

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    return InkWell(
      onTap: () => pressItem(_pageQuizProvider, practiceFile),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: kcWhiteColor, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  practiceFile.fileTitle,
                  style: kDefaultTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: h3),
                ),
                Row(
                  children: [
                    Text(
                      '${practiceFile.fileQuestionCount}',
                      style: kDefaultTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                    Text(
                      " questions - ",
                      style: kDefaultTextStyle.copyWith(
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "${practiceFile.fileSize} MB",
                      style: kDefaultTextStyle.copyWith(color: primaryColor),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          practiceFile.fileTakeFrom,
                          style: kDefaultTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: h5),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_downward,
                              color: primaryColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.history_rounded,
                              color: primaryColor,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
