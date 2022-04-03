import 'package:flutter/material.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_general_container.dart';

class VocabularyListScroller extends StatelessWidget {
  const VocabularyListScroller();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double categoryHeight = screenSize.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
