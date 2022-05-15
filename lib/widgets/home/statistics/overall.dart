import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice/result.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/screens/history_screen.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

class Overall extends StatelessWidget {
  Overall({Key? key}) : super(key: key);
  double _value = 0.1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Text(
            "Overall",
            style: ktsTitleWidget,
          ),
          verticalSpaceTiny,
          SizedBox(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                text: 'Correct ',
                style: ktsBoldText.copyWith(
                  color: kcCorrect,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "/ ",
                    style: ktsBoldText.copyWith(
                      color: kcBackgroundProgress,
                    ),
                  ),
                  TextSpan(
                      text: "Wrong ",
                      style: ktsBoldText.copyWith(
                        color: kcWrong,
                      )),
                  TextSpan(
                    text: "/ ",
                    style: ktsBoldText.copyWith(
                      color: kcBackgroundProgress,
                    ),
                  ),
                  TextSpan(
                      text: "No selected",
                      style: ktsBoldText.copyWith(color: kcBackgroundProgress)),
                ],
              ),
            ),
          ),
          verticalSpaceSmall,
          PartOverall(part: 'part1'),
          verticalSpaceSmall,
          PartOverall(part: 'part2'),
          verticalSpaceSmall,
          PartOverall(part: 'part3'),
          verticalSpaceSmall,
          PartOverall(part: 'part4'),
          verticalSpaceSmall,
          PartOverall(part: 'part5'),
          verticalSpaceSmall,
          PartOverall(part: 'part6'),
          verticalSpaceSmall,
          PartOverall(part: 'part7'),
          verticalSpaceSmall,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => HistoryScreen(),
                  isScrollControlled: true,
                );
              },
              child: Text("View history"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(kcWhiteColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kcPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red)
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

class PartOverall extends StatefulWidget {
  final String part;
  const PartOverall({Key? key, required this.part}) : super(key: key);

  @override
  State<PartOverall> createState() => _PartOverallState();
}

class _PartOverallState extends State<PartOverall> {
  int numCorrect = 0, numInCorrect = 0, numUnSelect = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseHandler.getOverallPart(widget.part),
        builder: (context, AsyncSnapshot<List<Result>> snapshot) {
          if (snapshot.data == null) {
            numCorrect = 0;
            numInCorrect = 0;
            numUnSelect = 0;
          } else {
            List<Result> lResult = snapshot.data!.map((doc) => doc).toList();
            lResult.forEach((result) {
              numCorrect += result.numberCorrect;
              numInCorrect += result.numberInCorrect;
              numUnSelect += result.numberUnSelect;
            });
          }

          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Something Error"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          return Column(
            children: [
              Stack(
                children: [
                  Text("Part " + widget.part.substring(4) + ":",
                      style: ktsBoldText),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        text: numCorrect.toString(),
                        style: ktsBoldText.copyWith(
                          color: kcCorrect,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " / ",
                            style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress,
                            ),
                          ),
                          TextSpan(
                              text: numInCorrect.toString(),
                              style: ktsBoldText.copyWith(
                                color: kcWrong,
                              )),
                          TextSpan(
                            text: " / ",
                            style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress,
                            ),
                          ),
                          TextSpan(
                              text: numUnSelect.toString(),
                              style: ktsBoldText.copyWith(
                                  color: kcBackgroundProgress)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpaceTiny,
              ((numCorrect + numInCorrect + numUnSelect) == 0)
                  ? LinearProgressIndicator(
                      value: 0.1,
                      backgroundColor: kcBackgroundProgress,
                      minHeight: 5,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                    )
                  : Stack(
                      children: [
                        LinearProgressIndicator(
                          value: 0,
                          backgroundColor: kcBackgroundProgress,
                          minHeight: 5,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                        ),
                        SizedBox(
                            width: (numCorrect + numInCorrect) *
                                (MediaQuery.of(context).size.width - 40) /
                                (numCorrect + numInCorrect + numUnSelect),
                            child: LinearProgressIndicator(
                              value: numCorrect / (numCorrect + numInCorrect),
                              backgroundColor: kcWrong,
                              minHeight: 5,
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(kcCorrect),
                            )),
                      ],
                    ),
            ],
          );
        });
  }
}
