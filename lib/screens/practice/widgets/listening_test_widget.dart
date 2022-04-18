import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/widgets/list_answer_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/pratice/page_quiz_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';
import '../../../widgets/home/practices/audio_player_widget.dart';
import '../../../widgets/home/practices/review_widget.dart';

class ListeningTestWidget extends StatefulWidget {
  ListeningTestWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  bool isShowAnswer = false;
  bool isPlaying = false;
  @override
  State<ListeningTestWidget> createState() => _ListeningTestWidgetState();
}

class _ListeningTestWidgetState extends State<ListeningTestWidget> {
  @override
  Widget build(BuildContext context) {
    final PageQuizProvider pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    void nextPage() {
      int? currentPage = pageQuizProvider.pageController.page?.toInt();
      if (currentPage == 3) {
        Get.dialog(AlertDialog(
          title: const Text('Do you want to submit?'),
          content: const Text('You are on the last question.'),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () => Get.back(),
            ),
            TextButton(
                child: const Text("Yes", style: TextStyle(color: Colors.green)),
                onPressed: () {
                  Navigator.pop(context);
                  Get.to(ReviewWidget(
                    chartData: chartData,
                  ));
                }),
          ],
        ));
      } else {
        pageQuizProvider.pageController.animateToPage(
            pageQuizProvider.pageController.page!.toInt() + 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn);
      }
    }

    void previousPage() {
      pageQuizProvider.pageController.animateToPage(
          pageQuizProvider.pageController.page!.toInt() - 1,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/part_1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: kDefaultBorderRadius,
                                    topRight: kDefaultBorderRadius)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      (widget.index + 1).toString(),
                                      style: kDefaultTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      ListAnswerWidget(
                        isShowAnswer: widget.isShowAnswer,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
