import 'vocabulary_topic.dart';

class VocabularyDocument {
  late int _idDocument;
  late String _titleDocument;
  late String _imageSourceDocument;
  late List<VocabularyTopic> listTopic;

  VocabularyDocument({
    required idDocument,
    required titleDocument,
    required imageSourceDocument,
    required this.listTopic,
  }) {
    this.idDocument = idDocument;
    this.titleDocument = titleDocument;
    this.imageSourceDocument = imageSourceDocument;
  }

  get idDocument => _idDocument;

  set idDocument(value) => _idDocument = value;

  get titleDocument => _titleDocument;

  set titleDocument(value) => _titleDocument = value;

  get imageSourceDocument => _imageSourceDocument;

  set imageSourceDocument(value) => _imageSourceDocument = value;

  getTotalWordInList() {
    int totalWord = 0;
    for (VocabularyTopic item in listTopic) {
      totalWord += item.listVocabulary.length;
    }
    return totalWord;
  }
}
