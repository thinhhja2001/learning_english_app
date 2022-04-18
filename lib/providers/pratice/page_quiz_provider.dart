import 'package:flutter/material.dart';

import '../../models/practice_file.dart';

class PageQuizProvider extends ChangeNotifier {
  late PageController _pageController;
  PageController get pageController => _pageController;

  late PracticeFile _practiceFile;
  PracticeFile get practiceFile => _practiceFile;

  late int _quizTotalQuestion;
  int get quizTotalQuestion => _quizTotalQuestion;

  late String _quizQuestionDescription;
  String get quizQuestionDescription => _quizQuestionDescription;

  updatePractice(PracticeFile practiceFile) {
    _practiceFile = practiceFile;
    notifyListeners();
  }
}
