// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/vocabulary/vocabulary_document.dart';
import '../../models/vocabulary/vocabulary_topic.dart';
import '../../providers/vocabulary/vocabulary_controller.dart';
import '../../utils/styles.dart';
import '../../widgets/home/vocabulary/appbar_vocabulary.dart';
import '../../widgets/home/vocabulary/vocabulary_item.dart';

class VocabularyTopicListScreen extends StatefulWidget {
  const VocabularyTopicListScreen({Key? key}) : super(key: key);

  @override
  _VocabularyTopicListState createState() => _VocabularyTopicListState();
}

class _VocabularyTopicListState extends State<VocabularyTopicListScreen> {
  @override
  Widget build(BuildContext context) {
    VocabularyController _vocabularyController =
        Get.put(VocabularyController());
    List<VocabularyTopic> vocabularyTopic =
        _vocabularyController.listVocabularyTopic;

    VocabularyDocument vocabularyDocument =
        _vocabularyController.getVocabularyDocumentByIndex();
    return Scaffold(
        appBar: AppBarVocabularyList(
            title: vocabularyDocument.titleDocument,
            imageSource: vocabularyDocument.imageSourceDocument,
            totalWord: vocabularyDocument.getTotalWordInList(),
            totalWordLearned: _vocabularyController.totalWordLearned.value),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
              ],
            ),
          )),
        ),
        floatingActionButton: SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Row(
                children: const [
                  Icon(Icons.fiber_new_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "Learn new words",
                    style: ktsWhiteTitle,
                  ),
                ],
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            )));
  }
}
