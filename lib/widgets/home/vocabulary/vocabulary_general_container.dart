import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/providers/vocabulary/vocabulary_controller.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_general_point.dart';

import '../../../screens/vocabulary/vocabularytopic_list_screen.dart';
import '../../../utils/styles.dart';

// ignore: must_be_immutable
class VocabularyGeneralContainer extends StatelessWidget {
  VocabularyGeneralContainer({
    Key? key,
    required this.screenSize,
    required this.vocabularyDocument,
    required this.index,
  }) : super(key: key);

  final Size screenSize;
  VocabularyDocument vocabularyDocument;
  int index;

  @override
  Widget build(BuildContext context) {
    VocabularyController _vocabularyController =
        Get.put(VocabularyController());
    final double categoryHeight = screenSize.height * 0.30 - 60;
    final double pointWidth = screenSize.width * 0.5 - 40;
    return Container(
      width: screenSize.width * 0.5,
      margin: const EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: InkWell(
        onTap: () => {
          _vocabularyController.clickItemInVocabularyDocument(index),
          Get.to(const VocabularyTopicListScreen())
        },
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54])
                    .createShader(
                        Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            vocabularyDocument.imageSourceDocument),
                        fit: BoxFit.fill),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  vocabularyDocument.titleDocument,
                  style: ktsWhiteTitle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: pointWidth,
                    child: VocabularyGenralPoint(
                        totalWord: vocabularyDocument.getTotalWordInList(),
                        totalWordLearned:
                            _vocabularyController.totalWordLearned.value),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
