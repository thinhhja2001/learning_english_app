// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/favorite_vocabulary.dart';

import '../../../screens/vocabulary/word_screen.dart';
import '../../../utils/styles.dart';

class WordFavoriteItem extends StatelessWidget {
  const WordFavoriteItem(
      {Key? key, required this.favoriteWord, required this.index})
      : super(key: key);
  final FavoriteWord favoriteWord;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            // _vocabularyProvider.updateWord(widget.word);
            Get.to(WordScreen(
                wordId: favoriteWord.wordId!,
                topicId: favoriteWord.topicId!,
                docId: favoriteWord.docId!,
                wordName: favoriteWord.word!));
            print("Word Tap");
          },
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Center(
                            child: Text("${index + 1}. ",
                                style: ktsBlackBigTitle.copyWith(
                                    color: Colors.green))),
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(favoriteWord.word!,
                                style: ktsBlackBigTitle.copyWith(
                                    color: Colors.green)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoriteWord.type!,
                                    style: ktsDescriptionItalic.copyWith(
                                        color: Colors.green),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 4),
                                  SizedBox(
                                    width: screenSize.width * 0.65,
                                    child: Text(favoriteWord.meaning!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: ktsDescription),
                                  )
                                ])
                          ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
