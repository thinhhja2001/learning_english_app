// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../utils/utils.dart';

class ListAnswerWidget extends StatefulWidget {
  bool isShowAnswer;
  List<String> answers;
  int correctAnswerIndex;
  ListAnswerWidget(
      {Key? key,
      required this.isShowAnswer,
      required this.answers,
      required this.correctAnswerIndex})
      : super(key: key);

  @override
  State<ListAnswerWidget> createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget> {
  String? _choseAnswer;
  int? _choseAnswerIndex;
  @override
  Widget build(BuildContext context) {
    // print(widget.answers);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          widget.answers.length,
          (index) => ListTile(
                title: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: String.fromCharCode(index + 65),
                        style: kDefaultTextStyle.copyWith(
                            color: getShowColor1(
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswerIndex,
                                answerIndex: index,
                                correctAnswerIndex: widget.correctAnswerIndex),
                            fontWeight: getFontWeight1(
                                answerIndex: index,
                                correctAnswerIndex: widget.correctAnswerIndex,
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswerIndex))),
                    TextSpan(
                        text: ". ${widget.answers[index]}",
                        style: kDefaultTextStyle.copyWith(
                            color: getShowColor1(
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswerIndex,
                                answerIndex: index,
                                correctAnswerIndex: widget.correctAnswerIndex),
                            fontWeight: getFontWeight1(
                                answerIndex: index,
                                correctAnswerIndex: widget.correctAnswerIndex,
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswerIndex))),
                  ]),
                ),
                leading: Radio<String>(
                  value: widget.answers[index],
                  groupValue: _choseAnswer,
                  onChanged: (value) => setState(() {
                    widget.isShowAnswer = true;
                    _choseAnswer = value;
                    _choseAnswerIndex = index;
                  }),
                ),
              )),
    );
  }
}
