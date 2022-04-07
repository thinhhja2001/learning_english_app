import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/providers/vocabulary/vocabulary_controller.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_general_container.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_widget.dart';

class VocabularyListScroller extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const VocabularyListScroller();

  @override
  Widget build(BuildContext context) {
    VocabularyController _vocabularyController =
        Get.put(VocabularyController());
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              ...List.generate(
                  _vocabularyController.listVocabularyDocument.length,
                  (index) => VocabularyGeneralContainer(
                        screenSize: screenSize,
                        vocabularyDocument:
                            _vocabularyController.listVocabularyDocument[index],
                        index: index,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
