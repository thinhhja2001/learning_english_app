// import 'dart:ffi';

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/models/practice/practice_quiz.dart';
import 'package:learning_english_app/models/practice/quiz.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';

class PageQuizProvider extends ChangeNotifier {
  late PageController pageController;

  late PracticeFile _practiceFile;

  PracticeFile get practiceFile => _practiceFile;

  late List<Quiz> _listQuiz;
  List<Quiz> get listQuiz => _listQuiz;

  late int quizTotalQuestion;

  late String quizQuestionDescription;

  late List<PracticeQuiz> _listPracticeQuiz;
  List<PracticeQuiz> get listPracticeQuiz => _listPracticeQuiz;

  updatePractice(PracticeFile practiceFile) async {
    _practiceFile = practiceFile;
    print("ID: " + practiceFile.id!);
    print("name: " + practiceFile.practice.practicePart.name);

    _listQuiz = await FirebaseHandler.getListQuiz(
        _practiceFile.id!, _practiceFile.practice.practicePart.name);
    print(_listQuiz.length);
    quizQuestionDescription = _listQuiz.first.id.toString();
    quizTotalQuestion = _listQuiz.length;
  }

  updatePracticeFavorite(String test, String part) async {
    _listQuiz = await FirebaseHandler.getListQuiz(test, part);
    quizQuestionDescription = _listQuiz.first.id.toString();
    quizTotalQuestion = _listQuiz.length;
  }

  countDocuments(String testId, String part, List<String> allOldData) async {
    List<String> allNewData;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .get(); // Count of Documents in Collection

    // Get data from docs and convert map to List
    allNewData = querySnapshot.docs.map((doc) => doc.id).toList();
    return allNewData;
  }
}
