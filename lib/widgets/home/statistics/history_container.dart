// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../models/practice/practice_file.dart';
import '../../../models/practice/result.dart';
import '../../../providers/pratice/dialog_quiz_controller.dart';
import '../../../providers/pratice/loading_provider.dart';
import '../../../providers/pratice/page_quiz_provider.dart';
import '../../../screens/practice/page_quiz_screen.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

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

    Get.to(const PageQuizScreen());
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
