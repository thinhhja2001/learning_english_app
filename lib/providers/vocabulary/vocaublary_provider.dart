import 'package:flutter/cupertino.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';

class VocabularyProvider extends ChangeNotifier {
  late VocabularyDocument _document;
  VocabularyDocument get document => _document;

  late VocabularyTopic _topic;
  VocabularyTopic get topic => _topic;

  late Vocabulary _word;
  Vocabulary get word => _word;

  updateDocument(VocabularyDocument vocabularyDocument) {
    _document = vocabularyDocument;
  }

  updateTopic(VocabularyTopic vocabularyTopic) {
    _topic = vocabularyTopic;
  }

  updateWord(Vocabulary vocabulary) {
    _word = vocabulary;
  }
}
