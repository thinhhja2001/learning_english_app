import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/providers/vocabulary/vocabulary_controller.dart';
import '../../utils/styles.dart';
import '../../widgets/home/vocabulary/appbar_vocabulary.dart';
import '../../widgets/home/vocabulary/word_item.dart';

class VocabularyListScreen extends StatefulWidget {
  const VocabularyListScreen({Key? key}) : super(key: key);

  @override
  _VocabularyListState createState() => _VocabularyListState();
}

class _VocabularyListState extends State<VocabularyListScreen> {
  final double _progressValue = 0.2;

  @override
  Widget build(BuildContext context) {
    VocabularyController _vocabularyController =
        Get.put(VocabularyController());
    List<VocabularyTopic> vocabularyTopic =
        _vocabularyController.listVocabularyTopic;

    VocabularyDocument vocabularyDocument =
        _vocabularyController.getVocabularyDocumentByIndex();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarVocabularyList(
            title: vocabularyDocument.titleDocument,
            imageSource: vocabularyDocument.imageSourceDocument,
            totalWord: vocabularyDocument.getTotalWordInList(),
            totalWordLearned: _vocabularyController.totalWordLearned.value),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                ]),
          )),
        ),
        floatingActionButton: Wrap(
            direction: Axis.horizontal, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    label: Row(
                      children: [
                        const Icon(Icons.fiber_new_rounded,
                            color: Colors.white),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: const Text(
                            "Learn new words",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: ktsWhiteTitle,
                          ),
                        ),
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  )),
              Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green.shade300,
                    onPressed: () {},
                    label: Row(
                      children: const [
                        Icon(Icons.flip, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Flashcard",
                          style: ktsWhiteTitle,
                        ),
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  )),
            ]));
  }
}
