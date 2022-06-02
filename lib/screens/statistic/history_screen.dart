// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/models/practice/result.dart';
import 'package:learning_english_app/providers/pratice/dialog_quiz_controller.dart';
import 'package:learning_english_app/providers/pratice/loading_provider.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/screens/practice/page_quiz_screen.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcGreyColor,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: kcWhiteColor,
          title: const Text("History", style: ktsTitleAppBar),
        ),
        body: FutureBuilder(
            future: FirebaseHandler.getHistoryResult(),
            builder: (context, AsyncSnapshot<List<Result>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.black));
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something error"));
              }
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/empty_box.png",
                        height: 100,
                        width: 100,
                      ),
                      const Text("No item here!"),
                      verticalSpaceSmall,
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text("Try again"),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(kcWhiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kcPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            ))),
                      ),
                    ],
                  ),
                );
              }
              List<Result> lResult = snapshot.data!.map((doc) => doc).toList();
              if (lResult.isNotEmpty) {
                lResult.sort((a, b) => b.time!.compareTo(a.time!));
              }
              return ListView.builder(
                  itemCount: lResult.length,
                  itemBuilder: (context, index) =>
                      HistoryContainer(historyResult: lResult[index]));
              // lResult.forEach((result) { HistoryContainer(historyResult: result,)});
            }));
  }
}

class HistoryContainer extends StatelessWidget {
  final Result historyResult;
  const HistoryContainer({Key? key, required this.historyResult})
      : super(key: key);

  pressItem(LoadingProvider loadingProvider, PageQuizProvider pageQuizProvider,
      DialogQuizProvider dialogQuizProvider, PracticeFile practiceFile) async {
    loadingProvider.updateLoading();

    await pageQuizProvider.updatePractice(practiceFile);
    await dialogQuizProvider.getAllQuestion(
        practiceFile.id!, practiceFile.practice.practicePart.name);
    loadingProvider.updateLoading();

    Get.to(
      const PageQuizScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    final DialogQuizProvider _dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);
    final LoadingProvider _loadingProvider =
        Provider.of<LoadingProvider>(context);
    int part = int.parse(historyResult.part!.substring(4));
    int numCorrect = historyResult.numberCorrect;
    int numInCorrect = historyResult.numberInCorrect;
    int numUnSelect = historyResult.numberUnSelect;
    String formattedTime =
        DateFormat('kk:mm').format(historyResult.time!.toDate());
    String formattedDate =
        DateFormat('dd.MM.yyyy').format(historyResult.time!.toDate());
    return Center(
      child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formattedTime,
                    style: ktsBoldText,
                  ),
                  Text(formattedDate)
                ],
              ),
              horizontalSpaceTiny,
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    const VerticalDivider(
                      width: 10,
                      thickness: 2,
                      indent: 15,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                  // width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(practicePartName[part - 1]),
                      Text(
                        practicePartTitle[part - 1] +
                            " 0" +
                            historyResult.testID!.substring(4),
                        style: ktsBoldText,
                      ),
                      verticalSpaceSmall,
                      Stack(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width * 2 / 3),
                            child: LinearProgressIndicator(
                              value: 0,
                              backgroundColor: kcBackgroundProgress,
                              minHeight: 5,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                            ),
                          ),
                          SizedBox(
                              width: (numCorrect + numInCorrect) *
                                  (MediaQuery.of(context).size.width * 2 / 3) /
                                  (numCorrect + numInCorrect + numUnSelect),
                              child: LinearProgressIndicator(
                                value: (numCorrect + numInCorrect) == 0
                                    ? 0
                                    : numCorrect / (numCorrect + numInCorrect),
                                backgroundColor: kcWrong,
                                minHeight: 5,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(kcCorrect),
                              )),
                        ],
                      ),
                      verticalSpaceSmall,
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 2 / 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              Text(
                                numCorrect.toString(),
                                style: ktsBoldText.copyWith(
                                  color: kcCorrect,
                                ),
                              ),
                              Text(
                                'Correct',
                              )
                            ]),
                            Column(children: [
                              Text(
                                numInCorrect.toString(),
                                style: ktsBoldText.copyWith(
                                  color: kcWrong,
                                ),
                              ),
                              Text(
                                'Wrong',
                              )
                            ]),
                            Column(children: [
                              Text(
                                numUnSelect.toString(),
                                style: ktsBoldText.copyWith(
                                  color: kcBackgroundProgress,
                                ),
                              ),
                              Text(
                                'No selected',
                              )
                            ]),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 2 / 3),
                        child: ElevatedButton(
                          onPressed: () async => await pressItem(
                              _loadingProvider,
                              _pageQuizProvider,
                              _dialogQuizProvider,
                              PracticeFile(
                                  id: historyResult.testID,
                                  fileTitle: practicePartShortTitle[part - 1],
                                  practice: part < 5
                                      ? listenings[part - 1]
                                      : readings[part - 5])),
                          child: Text("Do again"),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kcWhiteColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kcPrimaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                // side: BorderSide(color: Colors.red)
                              ))),
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
