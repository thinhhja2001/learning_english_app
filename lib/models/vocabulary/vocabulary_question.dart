class VocabularyQuestion {
  late int _idQuestion;
  late int _answerQuestion;
  late String _question;
  late List<String> _options;

  int get idQuestion => _idQuestion;

  set idQuestion(value) => _idQuestion = value;

  get answerQuestion => _answerQuestion;

  set answerQuestion(value) => _answerQuestion = value;

  get question => _question;

  set question(value) => _question = value;

  get options => _options;

  set options(value) => _options = value;
  VocabularyQuestion({
    required int idQuestion,
    required int answerQuestion,
    required String question,
    required List<String> options,
  }) {
    this.idQuestion = idQuestion;
    this.answerQuestion = answerQuestion;
    this.question = question;
    this.options = options;
  }
}
