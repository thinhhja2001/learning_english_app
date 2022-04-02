import 'package:flutter/material.dart';
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
          Stack(
            children: [
              Text("Part 1:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 2:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 3:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 4:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 5:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 6:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
          verticalSpaceSmall,
          Stack(
            children: [
              Text("Part 7:", style: ktsBoldText),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: '0 ',
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
                          text: "0 ",
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
                          text: "0",
                          style: ktsBoldText.copyWith(
                              color: kcBackgroundProgress)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          LinearProgressIndicator(
            value: _value,
            backgroundColor: kcBackgroundProgress,
            minHeight: 5,
            valueColor: new AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          ),
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
