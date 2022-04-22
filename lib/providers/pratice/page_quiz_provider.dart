// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/practice_file.dart';
import '../../models/practice_quiz.dart';

class PageQuizProvider extends ChangeNotifier {
  late PageController _pageController;
  PageController get pageController => _pageController;

  late PracticeFile _practiceFile;
  PracticeFile get practiceFile => _practiceFile;

  late int _quizTotalQuestion;
  int get quizTotalQuestion => _quizTotalQuestion;

  late String _quizQuestionDescription;
  String get quizQuestionDescription => _quizQuestionDescription;

  late List<PracticeQuiz> _listPracticeQuiz;
  List<PracticeQuiz> get listPracticeQuiz => _listPracticeQuiz;

  updatePractice(PracticeFile practiceFile) {
    _practiceFile = practiceFile;
    notifyListeners();
  }

  void countDocuments(
      String testId, String part, List<String> allOldData) async {
    var allNewData;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .get(); // Count of Documents in Collection

    // Get data from docs and convert map to List
    allNewData = querySnapshot.docs.map((doc) => doc.id).toList();
    // if (allOldData.length != allNewData.length)
    // notifyListeners();
    // print(allOldData);
    // print(allNewData);
    // print(allOldData.length != allNewData.length);
    // if (allOldData.length != allNewData.length) {
    //   notifyListeners();
    //   return allNewData;
    // }
    return allNewData;
  }
}
