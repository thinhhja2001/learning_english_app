// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/list_quiz_question.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../providers/pratice/dialog_quiz_controller.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';

class ListAnswerWidget extends StatefulWidget {
  bool isShowAnswer;
  List<String> answers;
  int correctAnswerIndex;
  int index;
  ListAnswerWidget(
      {Key? key,
      required this.isShowAnswer,
      required this.answers,
      required this.correctAnswerIndex,
      required this.index})
      : super(key: key);

  @override
  State<ListAnswerWidget> createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget> {
  String? _choseAnswer;
  int? _choseAnswerIndex;
  bool isSelect = true;
  @override
  Widget build(BuildContext context) {
    DialogQuizProvider dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);
    var quiz = dialogQuizProvider.getQuizQuestion(widget.index);
    if (quiz != 1) {
      if (quiz.isShowAnswer!) {
        widget.isShowAnswer = true;
        setState(() {
          isSelect = false;
        });
        _choseAnswerIndex = quiz.indexAnswer;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          widget.answers.length,
          (index) => widget.answers[index] != ''
              ? ListTile(
                  title: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: String.fromCharCode(index + 65),
                          style: kDefaultTextStyle.copyWith(
                              color: getShowColor1(
                                  isShowAnswer: widget.isShowAnswer,
                                  choseAnswer: _choseAnswerIndex,
                                  answerIndex: index,
                                  correctAnswerIndex:
                                      widget.correctAnswerIndex),
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
                                  correctAnswerIndex:
                                      widget.correctAnswerIndex),
                              fontWeight: getFontWeight1(
                                  answerIndex: index,
                                  correctAnswerIndex: widget.correctAnswerIndex,
                                  isShowAnswer: widget.isShowAnswer,
                                  choseAnswer: _choseAnswerIndex))),
                    ]),
                  ),
                  leading: Radio<int>(
                    value: index,
                    groupValue: _choseAnswerIndex,
                    onChanged: (value) => setState(() {
                      if (isSelect) {
                        widget.isShowAnswer = true;
                        _choseAnswerIndex = index;
                        dialogQuizProvider.selectAnswer(index, widget.index);

                        setState(() {
                          isSelect = false;
                        });
                      }
                    }),
                  ),
                )
              : const SizedBox()),
    );
  }
}
