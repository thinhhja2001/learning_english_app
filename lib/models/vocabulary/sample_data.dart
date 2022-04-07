// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_question.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';

List sample_vocabulary_question = [
  {
    "id": 1,
    "question": "abide by nghĩa là gì ______",
    "options": ['tôn trọng', 'đồng ý', 'vâng lời', 'lịch sự'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "agreement nghĩa là gì ______",
    "options": ['tôn trọng', 'đồng ý', 'vâng lời', 'lịch sự'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "obident nghĩa là gì ______",
    "options": ['tôn trọng', 'đồng ý', 'vâng lời', 'lịch sự'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "polite nghĩa là gì ______",
    "options": ['tôn trọng', 'đồng ý', 'vâng lời', 'lịch sự'],
    "answer_index": 3,
  },
];

List<VocabularyQuestion> sampleListQuestion = sample_vocabulary_question
    .map((question) => VocabularyQuestion(
        idQuestion: question['id'],
        question: question['question'],
        options: question['options'],
        answerQuestion: question['answer_index']))
    .toList();

List sample_vocabulary = [
  {
    "id": 1,
    "word": "abide by",
    "spell": "/ə'baid/",
    "type": "verb",
    "meaningEN": "to accept and act according to a law, an agreement",
    "meaningVN": "tôn trọng, tuân theo, giữ (lời)",
    "examples": [
      'The two parties agreed to abide by the judge\'s decision',
      'Hai bên đã đồng ý tuân theo quyết định của tòa án.'
    ],
    "image": "assets/images/toeic_image.jpg",
    "audio": "1",
    "percent": 0.0,
    "listQuestion": sampleListQuestion,
  },
  {
    "id": 2,
    "word": "agreement",
    "spell": "/ə'gri:mənt/",
    "type": "noun",
    "meaningEN": "an arrangement, a promise or a contract made with somebody",
    "meaningVN": "hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau",
    "examples": [
      'According to the agreement, the caterer will also supply the flowers for the event',
      'According to the agreement, the caterer will also supply the flowers for the event'
    ],
    "image": "assets/images/toeic_image.jpg",
    "audio": "1",
    "percent": 0.8,
    "listQuestion": sampleListQuestion,
  },
];

List<Vocabulary> sampleListVocabulary = sample_vocabulary
    .map((vocabulary) => Vocabulary(
        idVocabulary: vocabulary['id'],
        word: vocabulary['word'],
        pronunciationVocabulary: vocabulary['spell'],
        typeVocabulary: vocabulary['type'],
        meaningEnglish: vocabulary['meaningEN'],
        meaningVietnamese: vocabulary['meaningVN'],
        exampleVocabulary: vocabulary['examples'],
        imageVocabulary: vocabulary['image'],
        audioVocabulary: vocabulary['audio'],
        percentLearned: vocabulary['percent'],
        listVocabularyQuestion: sampleListQuestion))
    .toList();

List sample_vocabulary_topic = [
  {
    "id": 1,
    "title": "Hợp đồng",
    "image": "assets/images/toeic_image.jpg",
    "listVocabulary": sampleListVocabulary,
  },
  {
    "id": 2,
    "title": "Thương mại",
    "image": "assets/images/toeic_image.jpg",
    "listVocabulary": sampleListVocabulary,
  },
];

List<VocabularyTopic> sampleListTopic = sample_vocabulary_topic
    .map((topic) => VocabularyTopic(
        idTopic: topic['id'],
        titleTopic: topic['title'],
        imageTopic: topic['image'],
        listVocabulary: sampleListVocabulary))
    .toList();

List sample_vocabulary_document = [
  {
    "idDocument": 1,
    "titleDocument": "600 từ vựng TOEIC",
    "imageSource": "assets/images/toeic_image.jpg",
    "listTopic": sampleListTopic,
  },
  {
    "idDocument": 2,
    "titleDocument": "Từ vựng TOEIC cho người mới",
    "imageSource": "assets/images/toeic_image.jpg",
    "listTopic": sampleListTopic,
  },
  {
    "idDocument": 3,
    "titleDocument": "Check your vocabulary for TOEIC",
    "imageSource": "assets/images/toeic_image.jpg",
    "listTopic": sampleListTopic,
  },
  {
    "idDocument": 4,
    "titleDocument": "600 Essential Words for the TOEIC",
    "imageSource": "assets/images/toeic_image.jpg",
    "listTopic": sampleListTopic,
  },
];
