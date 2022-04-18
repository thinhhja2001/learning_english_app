import 'package:flutter/cupertino.dart';

class QuizProvider extends ChangeNotifier {
  bool _isFavoritePress = false;
  bool _isAnswerPress = false;

  bool get isFavoritePress => _isFavoritePress;
  bool get isAnserPress => _isAnswerPress;

  void pressFavorite() {
    _isFavoritePress = !isFavoritePress;
    notifyListeners();
  }

  void pressAnswer() {
    _isAnswerPress = !isAnserPress;
    notifyListeners();
  }
}
