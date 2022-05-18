import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  int numberUnSelect = 0;
  int numberCorrect = 0;
  int numberInCorrect = 0;
  List chooseList = [];
  List correctList = [];
  late Timestamp? time;
  late String? testID;
  late String? part;
  late int? duration;

  Result(
      {required this.numberUnSelect,
      required this.numberCorrect,
      required this.numberInCorrect,
      required this.chooseList,
      required this.correctList,
      this.testID,
      this.part,
      this.duration,
      this.time});

  void disposeValue() {
    numberUnSelect = 0;
    numberCorrect = 0;
    numberInCorrect = 0;
    chooseList = [];
    correctList = [];
  }

  static Result fromSnap(
      {required DocumentSnapshot snap, String? testID, String? part}) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Result(
        numberUnSelect: snapshot['numUnSelect'] ?? 0,
        numberCorrect: snapshot['numCorrect'] ?? 0,
        numberInCorrect: snapshot['numInCorrect'] ?? 0,
        chooseList: snapshot['chooseList'] ?? [],
        correctList: snapshot['answerList'] ?? [],
        testID: testID,
        part: part,
        duration: snapshot['duration'] ?? 0,
        time: snapshot['time'] ?? DateTime.now().millisecondsSinceEpoch);
  }
}
