// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/providers/pratice/dialog_quiz_controller.dart';
import 'package:learning_english_app/providers/pratice/loading_provider.dart';
import 'package:learning_english_app/screens/practice/page_quiz_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/pratice/page_quiz_provider.dart';

class PracticeSelectionCard extends StatefulWidget {
  const PracticeSelectionCard({Key? key, required this.practiceFile})
      : super(key: key);
  final PracticeFile practiceFile;

  @override
  State<PracticeSelectionCard> createState() => _PracticeSelectionCardState();
}

class _PracticeSelectionCardState extends State<PracticeSelectionCard> {
  pressItem(LoadingProvider loadingProvider, PageQuizProvider pageQuizProvider,
      DialogQuizProvider dialogQuizProvider, PracticeFile practiceFile) async {
    loadingProvider.updateLoading();

    await pageQuizProvider.updatePractice(practiceFile);
    await dialogQuizProvider.getAllQuestion(
        practiceFile.id!, practiceFile.practice.practicePart.name);

    loadingProvider.updateLoading();

    Get.to(PageQuizScreen());
  }

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    final DialogQuizProvider _dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);
    final LoadingProvider _loadingProvider =
        Provider.of<LoadingProvider>(context);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () async => await pressItem(_loadingProvider,
              _pageQuizProvider, _dialogQuizProvider, widget.practiceFile),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                widget.practiceFile.fileTitle!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ));
  }
}

// class PracticeSelectionCard extends StatelessWidget {
//   const PracticeSelectionCard({
//     Key? key,
//     required this.practiceFile,
//   }) : super(key: key);

//   final Color primaryColor = Colors.teal;
//   final PracticeFile practiceFile;

//   pressItem(PageQuizProvider pageQuizProvider,
//       DialogQuizProvider dialogQuizProvider, PracticeFile practiceFile) async {
//     await pageQuizProvider.updatePractice(practiceFile);
//     dialogQuizProvider.getAllQuestion(
//         practiceFile.id!, practiceFile.practice.practicePart.name);
//     Get.to(PageQuizScreen1());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final PageQuizProvider _pageQuizProvider =
//         Provider.of<PageQuizProvider>(context);
//     final DialogQuizProvider _dialogQuizProvider =
//         Provider.of<DialogQuizProvider>(context);
//     return Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: InkWell(
//           onTap: () async => await pressItem(
//               _pageQuizProvider, _dialogQuizProvider, practiceFile),
//           child: Center(
//             child: Text(
//               practiceFile.fileTitle!,
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         ));
//   }
// }
