import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizQuestion {
  String? id;
  int? indexAnswer;
  int? correctAnswer;
  bool? isShowAnswer;
  bool? isSelect;
  int? numberQuestion;

  QuizQuestion(
      {this.id,
      this.indexAnswer,
      this.correctAnswer,
      this.isShowAnswer,
      this.isSelect,
      this.numberQuestion});

  static QuizQuestion fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return QuizQuestion(
        id: snap.id,
        correctAnswer: convertAnswerToInt(snapshot['correctAnswer']),
        numberQuestion: (snapshot['D'] == null) ? 3 : 4,
        isSelect: false,
        isShowAnswer: false,
        indexAnswer: -1);
  }
}

class ListQuizQuestion {
  int? totalQuestion;
  List<QuizQuestion>? listQuestion;

  ListQuizQuestion({this.totalQuestion, this.listQuestion});
}

int convertAnswerToInt(String answerString) {
  switch (answerString) {
    case "A":
      return 0;
    case "B":
      return 1;
    case "C":
      return 2;
    case "D":
      return 3;
    default:
      return -1;
  }
}
