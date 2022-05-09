// ignore_for_file: prefer_const_constructors

// import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/providers/pratice/dialog_quiz_controller.dart';
import 'package:learning_english_app/widgets/home/practices/question_widget.dart';
import 'package:learning_english_app/screens/practice/review_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../providers/pratice/page_quiz_provider.dart';
import '../../utils/colors.dart';
import '../../widgets/home/practices/appbar_quiz_practice.dart';

class PageQuizScreen extends StatefulWidget {
  PageQuizScreen({Key? key}) : super(key: key);

  @override
  State<PageQuizScreen> createState() => _PageQuizScreenState();
}

class _PageQuizScreenState extends State<PageQuizScreen> {
  int maxIndex = 0;

  var allData = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    // countDocuments('test1', 'part6');
    super.initState();
  }

  void countDocuments(String testId, String part) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .get(); // Count of Documents in Collection

    // Get data from docs and convert map to List
    // print(count);

    // if (count == 0) {
    //   count++;
    //   setState(() {

    //     count++;
    //   });
    // }
    this.allData = querySnapshot.docs.map((doc) => doc.id).toList();

    print(this.allData);
    maxIndex = this.allData.length;
  }

  void showDialog(DialogQuizProvider dialogQuizProvider) {
    Get.dialog(AlertDialog(
      title: const Text('Do you want to submit?'),
      content: const Text('You are on the last question.'),
      actions: [
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: const Text("Yes", style: TextStyle(color: Colors.green)),
          onPressed: () async {
            await dialogQuizProvider.getResult();
            Get.back();
            Get.off(ReviewScreen());
          },
        ),
      ],
    ));
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);

    final DialogQuizProvider _dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);

    maxIndex = _pageQuizProvider.quizTotalQuestion;
    SwiperController swiperController = SwiperController();
    return Scaffold(
        backgroundColor: kcGreyColor,
        appBar: AppBarQuizPractice(),
        body: GestureDetector(
          child: Swiper(
              controller: swiperController,
              onIndexChanged: (value) {
                if (value == maxIndex) {
                  showDialog(_dialogQuizProvider);
                  swiperController
                      .previous()
                      .whenComplete(() => print("Complete"))
                      .onError((error, stackTrace) => print(error));
                }
              },
              indicatorLayout: PageIndicatorLayout.SCALE,
              autoplayDelay: 1000,
              itemCount: _pageQuizProvider.quizTotalQuestion + 1,
              loop: false,
              fade: 1.0,
              itemBuilder: (BuildContext context, int index) {
                if (index == maxIndex) {
                  return SizedBox();
                }
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: QuestionWidget(
                        index: index,
                        previousQuestion: () async =>
                            await swiperController.previous(),
                        nextQuestion: () async =>
                            await swiperController.next()));
                // child: QuestionWidget(
                //   pageQuizProvider: _pageQuizProvider,
                //   documentId: allData[index],
                // ));
                // return ReviewWidget(
                //     tooltipBehavior: tooltipBehavior,
                //     chartData: chartData,
                //     swiperController: swiperController);
              }),
        ));
  }
}
