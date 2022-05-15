import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  int numberUnSelect = 0;
  int numberCorrect = 0;
  int numberInCorrect = 0;
  List chooseList = [];
  List correctList = [];
  late Timestamp? time;

  Result(
      {required this.numberUnSelect,
      required this.numberCorrect,
      required this.numberInCorrect,
      required this.chooseList,
      required this.correctList,
      this.time});

  void disposeValue() {
    numberUnSelect = 0;
    numberCorrect = 0;
    numberInCorrect = 0;
    chooseList = [];
    correctList = [];
  }

  static Result fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Result(
        numberUnSelect: snapshot['numUnSelect'] ?? 0,
        numberCorrect: snapshot['numCorrect'] ?? 0,
        numberInCorrect: snapshot['numInCorrect'] ?? 0,
        chooseList: snapshot['chooseList'] ?? [],
        correctList: snapshot['answerList'] ?? [],
        time: snapshot['time'] ?? DateTime.now().millisecondsSinceEpoch);
  }
}
