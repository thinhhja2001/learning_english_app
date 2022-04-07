import 'vocabulary.dart';

class VocabularyTopic {
  late int _idTopic;
  late String _titleTopic;
  late String _imageTopic;
  late List<Vocabulary> listVocabulary;

  VocabularyTopic({
    required idTopic,
    required titleTopic,
    required imageTopic,
    required this.listVocabulary,
  }) {
    this.idTopic = idTopic;
    this.titleTopic = titleTopic;
    this.imageTopic = imageTopic;
  }

  get idTopic => _idTopic;

  set idTopic(value) => _idTopic = value;

  get titleTopic => _titleTopic;

  set titleTopic(value) => _titleTopic = value;

  get imageTopic => _imageTopic;

  set imageTopic(value) => _imageTopic = value;
}
