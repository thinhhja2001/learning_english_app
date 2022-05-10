// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/home/vocabulary/document_list_scroller.dart';
import 'package:learning_english_app/widgets/home/vocabulary/favourite_word_container.dart';

import '../../../utils/colors.dart';

class VocabularyGeneral extends StatefulWidget {
  const VocabularyGeneral({Key? key}) : super(key: key);

  @override
  _VocabularyGeneralState createState() => _VocabularyGeneralState();
}

class _VocabularyGeneralState extends State<VocabularyGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary", style: ktsTitleAppBar),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: kcGreyColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Text("List Vocaublary Document",
                  style: ktsBlackBigTitle.copyWith(
                      fontSize: 24, color: Colors.green)),
            ),
            Expanded(flex: 1, child: DocumentListScroller()),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: Text("My Favourite Vocabulary",
                  style: ktsBlackBigTitle.copyWith(
                      fontSize: 24, color: Colors.green)),
            ),
            Expanded(flex: 1, child: FavouriteWordContainer()),
          ],
        ),
      ),
    );
  }
}
