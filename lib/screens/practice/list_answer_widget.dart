// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';

class ListAnswerWidget extends StatefulWidget {
  ListAnswerWidget({
    Key? key,
    required this.isShowAnswer,
  }) : super(key: key);
  bool isShowAnswer;
  @override
  State<ListAnswerWidget> createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget> {
  String? _choseAnswer;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          answers.length,
          (index) => ListTile(
                title: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: String.fromCharCode(index + 65),
                        style: kDefaultTextStyle.copyWith(
                            color: getShowColor(
                                answer: answers[index],
                                correctAnswer: correctAnswer,
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswer),
                            fontWeight: getFontWeight(
                                answer: answers[index],
                                correctAnswer: correctAnswer,
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswer))),
                    TextSpan(
                        text: ". ${answers[index]}",
                        style: kDefaultTextStyle.copyWith(
                            color: getShowColor(
                              answer: answers[index],
                              correctAnswer: correctAnswer,
                              isShowAnswer: widget.isShowAnswer,
                              choseAnswer: _choseAnswer,
                            ),
                            fontWeight: getFontWeight(
                                answer: answers[index],
                                correctAnswer: correctAnswer,
                                isShowAnswer: widget.isShowAnswer,
                                choseAnswer: _choseAnswer)))
                  ]),
                ),
                leading: Radio<String>(
                  value: answers[index],
                  groupValue: _choseAnswer,
                  onChanged: (value) => setState(() {
                    widget.isShowAnswer = true;
                    _choseAnswer = value;
                  }),
                ),
              )),
    );
  }
}
