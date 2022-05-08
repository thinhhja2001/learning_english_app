// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice_file.dart';
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

  pressItem(
      PageQuizProvider pageQuizProvider, PracticeFile practiceFile) async {
    await pageQuizProvider.updatePractice(practiceFile);
    Get.to(PageQuizScreen1());
  }

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () async => await pressItem(_pageQuizProvider, practiceFile),
          child: Center(
            child: Text(
              practiceFile.fileTitle!,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
