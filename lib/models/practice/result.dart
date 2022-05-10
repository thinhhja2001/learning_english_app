import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  int numberUnSelect = 0;
  int numberCorrect = 0;
  int numberInCorrect = 0;
  List<int> chooseList = [];
  List<int> correctList = [];
  late Timestamp time;

  Result(this.numberUnSelect, this.numberCorrect, this.numberInCorrect,
      this.chooseList, this.correctList);

  void disposeValue() {
    numberUnSelect = 0;
    numberCorrect = 0;
    numberInCorrect = 0;
    chooseList = [];
    correctList = [];
  }
}
