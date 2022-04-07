// ignore_for_file: prefer_final_fields, unused_field

import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/sample_data.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/screens/vocabulary/vocabularytopic_list_screen.dart';

class VocabularyController extends GetxController {
  RxBool isLoading = false.obs; // Loading the list

  // Update the vocabulary when click the item in list
  RxInt indexDocument = (-1).obs;
  RxInt totalWordLearned = 0.obs;

  List<VocabularyDocument> listVocabularyDocument = sample_vocabulary_document
      .map((document) => VocabularyDocument(
            idDocument: document['idDocument'],
            titleDocument: document['titleDocument'],
            imageSourceDocument: document['imageSource'],
            listTopic: document['listTopic'],
          ))
      .toList();

  late List<VocabularyTopic> listVocabularyTopic;

  fetchVocabularyBookList() async {
    try {
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }

  clickItemInVocabularyDocument(index) {
    indexDocument(index);
    listVocabularyTopic = listVocabularyDocument[index].listTopic;
    update();
    // Get.to(const VocabularyTopicListScreen());
  }

  getVocabularyDocumentByIndex() {
    if (indexDocument.value != -1) {
      return listVocabularyDocument[indexDocument.value];
    } else {
      return null;
    }
  }
}
