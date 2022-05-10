import 'package:flutter/cupertino.dart';
import 'package:learning_english_app/models/practice/practice_quiz.dart';

class QuizProvider extends ChangeNotifier {
  bool _isFavoritePress = false;
  bool _isAnswerPress = false;

  bool get isFavoritePress => _isFavoritePress;
  bool get isAnserPress => _isAnswerPress;

  late PracticeQuiz _quiz;
  PracticeQuiz get quiz => _quiz;

  void pressFavorite() {
    _isFavoritePress = !isFavoritePress;
    notifyListeners();
  }

  void pressAnswer() {
    _isAnswerPress = !isAnserPress;
    notifyListeners();
  }
}
