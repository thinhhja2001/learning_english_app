class PracticeQuiz {
  late String _id;
  late int _totalQuestion;
  late List<Question> _listQuestion;
  String? _urlAudio;
  String? _urlImage;
  String? _urlDoc;
  String? _urlTranslateDoc;

  String get id => _id;
  String? get urlAudio => _urlAudio;
  String? get urlImage => _urlImage;
  String? get urlDoc => _urlDoc;
  String? get urlTranslateDoc => _urlTranslateDoc;
  int get totalQuestion => _totalQuestion;
  List<Question> get listQuestion => _listQuestion;
}

class Question {
  late int _id;
  late String _question;
  late List<Option> _listOption;
  late int _answer;

  int get id => _id;
  String get question => _question;
  List<Option> get listOption => _listOption;
  int get answer => _answer;
}

class Option {
  late int _id;
  late String _text;

  int get id => _id;
  String get text => _text;
}
