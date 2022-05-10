// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/screens/vocabulary/word_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/vocabulary/vocaublary_provider.dart';
import '../../../resources/firebase_reference.dart';
import '../../../utils/styles.dart';

class WordItem extends StatefulWidget {
  const WordItem({Key? key, required this.word, required this.index})
      : super(key: key);
  final Vocabulary word;
  final int index;

  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {
  addToFavorite(String wordId, String word, String meaning, String type,
      String docID, String topicID) async {
    await FirebaseHandler.addWordToFavorite(
        wordId, word, meaning, type, docID, topicID);
  }

  deleteFromFavorite(String wordId) async {
    await FirebaseHandler.deleteWordFromFavorite(wordId);
  }

  @override
  Widget build(BuildContext context) {
    final VocabularyProvider _vocabularyProvider =
        Provider.of<VocabularyProvider>(context);

    final VocabularyDocument _document = _vocabularyProvider.document;
    final VocabularyTopic _topic = _vocabularyProvider.topic;

    Size screenSize = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            // _vocabularyProvider.updateWord(widget.word);
            Get.to(WordScreen(
                wordId: widget.word.id!,
                topicId: _topic.id!,
                docId: _document.id!,
                wordName: widget.word.word!));
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
                            child: Text("${widget.index + 1}. ",
                                style: ktsBlackBigTitle.copyWith(
                                    color: Colors.green))),
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(widget.word.word!,
                                style: ktsBlackBigTitle.copyWith(
                                    color: Colors.green)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.word.type!,
                                    style: ktsDescriptionItalic.copyWith(
                                        color: Colors.green),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 4),
                                  SizedBox(
                                    width: screenSize.width * 0.6,
                                    child: Text(widget.word.meaning!,
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
                StreamBuilder(
                  stream: userFR
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("wordFavorites")
                      .where("wordId", isEqualTo: widget.word.id)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: IconButton(
                          onPressed: () => snapshot.data.docs.length == 0
                              ? addToFavorite(
                                  widget.word.id!,
                                  widget.word.word!,
                                  widget.word.meaning!,
                                  widget.word.type!,
                                  _document.id!,
                                  _topic.id!)
                              : deleteFromFavorite(widget.word.id!),
                          icon: snapshot.data.docs.length == 0
                              ? Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
