import 'package:flutter/cupertino.dart';
import 'package:learning_english_app/models/list_quiz_question.dart';

import '../../resources/firebase_handle.dart';

class DialogQuizProvider extends ChangeNotifier {
  int numberQuestion = 0;
  var allQuestion = <QuizQuestion>[];

  int numberCorrect = 0;
  int numberInCorrect = 0;
  int numberUnSelect = 0;

  void getResult() {
    print(
        "Result gia tri select $numberCorrect gia tri in correct $numberInCorrect gia tri un select $numberUnSelect");
    for (int i = 0; i < allQuestion.length; i++) {
      if (allQuestion[i].indexAnswer == -1) {
        numberUnSelect++;
      } else {
        if (allQuestion[i].indexAnswer == allQuestion[i].correctAnswer) {
          numberCorrect++;
        } else {
          numberInCorrect++;
        }
      }
    }
  }

  void selectAnswer(int answerIndex, int index) {
    QuizQuestion quiz = allQuestion.firstWhere((element) {
      return element.id!.compareTo(index.toString()) == 0;
    });

    quiz.indexAnswer = answerIndex;
    quiz.isShowAnswer = true;
    quiz.isSelect = true;
  }

  getQuizQuestion(int index) {
    if (allQuestion.isEmpty) {
      return 1;
    }
    QuizQuestion quiz = allQuestion.firstWhere((element) {
      return element.id!.compareTo(index.toString()) == 0;
    });
    return quiz;
  }

  void getAllQuestion(String test, String part) async {
    allQuestion =
        await FirebaseHandler.getListQuestionDetailForSumary(test, part);
    numberQuestion = allQuestion.length;
  }

  void disposeValue() {
    numberCorrect = 0;
    numberInCorrect = 0;
    numberUnSelect = 0;
    numberQuestion = 0;
    allQuestion = <QuizQuestion>[];

    print(
        "Dispose gia tri select $numberCorrect gia tri in correct $numberInCorrect gia tri un select $numberUnSelect");
  }
}
