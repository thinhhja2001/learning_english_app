import 'package:flutter/cupertino.dart';
import 'package:learning_english_app/models/practice/list_quiz_question.dart';
import 'package:learning_english_app/models/practice/result.dart';
import '../../resources/firebase_handle.dart';

class DialogQuizProvider extends ChangeNotifier {
  int numberQuestion = 0;
  var allQuestion = <QuizQuestion>[];
  String testQuiz = "";
  String partQuiz = "";

  late Result result;

  getResult(int duration) async {
    for (int i = 0; i < numberQuestion; i++) {
      result.chooseList.add(allQuestion[i].indexAnswer!);
      result.correctList.add(allQuestion[i].correctAnswer!);
    }
    print(
        "Result gia tri select ${result.numberCorrect} gia tri in correct ${result.numberInCorrect} gia tri un select ${result.numberUnSelect}");
    for (int i = 0; i < allQuestion.length; i++) {
      if (allQuestion[i].indexAnswer == -1) {
        result.numberUnSelect = result.numberUnSelect + 1;
      } else {
        if (allQuestion[i].indexAnswer == allQuestion[i].correctAnswer) {
          result.numberCorrect = result.numberCorrect + 1;
        } else {
          result.numberInCorrect = result.numberInCorrect + 1;
        }
      }
    }

    await FirebaseHandler.addResultToFirebase(
        testQuiz, partQuiz, result, duration);
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

  getAllQuestion(String test, String part) async {
    allQuestion =
        await FirebaseHandler.getListQuestionDetailForSumary(test, part);
    numberQuestion = allQuestion.length;
    testQuiz = test;
    partQuiz = part;
    result = Result(
        numberCorrect: 0,
        numberUnSelect: 0,
        numberInCorrect: 0,
        chooseList: [],
        correctList: []);
  }

  void disposeValue() {
    result.disposeValue();
    numberQuestion = 0;
    allQuestion = <QuizQuestion>[];

    print(
        "Dispose gia tri select ${result.numberCorrect} gia tri in correct ${result.numberInCorrect} gia tri un select ${result.numberUnSelect}");
  }
}
