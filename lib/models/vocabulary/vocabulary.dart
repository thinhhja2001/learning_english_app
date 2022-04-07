import 'vocabulary_question.dart';

class Vocabulary {
  late int _idVocabulary;
  late String _word;
  late String _pronunciationVocabulary;
  late String _typeVocabulary;
  late String _meaningEnglish;
  late String _meaningVietnamese;
  late List<String> _exampleVocabulary;
  late String _imageVocabulary;
  late String _audioVocabulary;
  late double _percentLearned;
  late List<VocabularyQuestion> listVocabularyQuestion;

  get idVocabulary => _idVocabulary;

  set idVocabulary(value) => _idVocabulary = value;

  get word => _word;

  set word(value) => _word = value;

  get pronunciationVocabulary => _pronunciationVocabulary;

  set pronunciationVocabulary(value) => _pronunciationVocabulary = value;

  get typeVocabulary => _typeVocabulary;

  set typeVocabulary(value) => _typeVocabulary = value;

  get meaningEnglish => _meaningEnglish;

  set meaningEnglish(value) => _meaningEnglish = value;

  get meaningVietnamese => _meaningVietnamese;

  set meaningVietnamese(value) => _meaningVietnamese = value;

  get exampleVocabulary => _exampleVocabulary;

  set exampleVocabulary(value) => _exampleVocabulary = value;

  get imageVocabulary => _imageVocabulary;

  set imageVocabulary(value) => _imageVocabulary = value;

  get audioVocabulary => _audioVocabulary;

  set audioVocabulary(value) => _audioVocabulary = value;

  get percentLearned => _percentLearned;

  set percentLearned(value) => _percentLearned = value;

  Vocabulary({
    required int idVocabulary,
    required String word,
    required String pronunciationVocabulary,
    required String typeVocabulary,
    required String meaningEnglish,
    required String meaningVietnamese,
    required List<String> exampleVocabulary,
    required String imageVocabulary,
    required String audioVocabulary,
    required double percentLearned,
    required this.listVocabularyQuestion,
  }) {
    this.idVocabulary = idVocabulary;
    this.word = word;
    this.pronunciationVocabulary = pronunciationVocabulary;
    this.typeVocabulary = typeVocabulary;
    this.meaningEnglish = meaningEnglish;
    this.meaningVietnamese = meaningVietnamese;
    this.exampleVocabulary = exampleVocabulary;
    this.imageVocabulary = imageVocabulary;
    this.audioVocabulary = audioVocabulary;
    this.percentLearned = percentLearned;
  }
}
