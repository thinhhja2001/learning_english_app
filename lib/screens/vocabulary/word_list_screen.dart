// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:provider/provider.dart';
import '../../providers/vocabulary/vocaublary_provider.dart';
import '../../resources/firebase_handle.dart';
import '../../widgets/home/vocabulary/appbar_vocabulary.dart';
import '../../widgets/home/vocabulary/word_item.dart';

class WordListScreen extends StatefulWidget {
  const WordListScreen({Key? key}) : super(key: key);

  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordListScreen> {
  List<Vocabulary> vocabularyList = [];

  @override
  Widget build(BuildContext context) {
    final VocabularyProvider _vocabularyProvider =
        Provider.of<VocabularyProvider>(context);
    final VocabularyTopic _topic = _vocabularyProvider.topic;
    final VocabularyDocument _document = _vocabularyProvider.document;
    return Scaffold(
        appBar: AppBarVocabularyList(
            imageSource: _topic.image!,
            title: _topic.title!,
            totalWord: _topic.numberWord!),
        body: FutureBuilder<List<Vocabulary>>(
            future:
                FirebaseHandler.getVocabularyList(_document.id!, _topic.id!),
            builder: (BuildContext context,
                AsyncSnapshot<List<Vocabulary>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Something Error"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.black));
              }
              vocabularyList = snapshot.data!.map((doc) => doc).toList();
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: AnimationLimiter(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 5.5,
                                  mainAxisSpacing: 10),
                          itemCount: vocabularyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredGrid(
                                columnCount: 1,
                                position: index,
                                duration: Duration(milliseconds: 1000),
                                child: ScaleAnimation(
                                    child: FadeInAnimation(
                                        delay: Duration(milliseconds: 100),
                                        child: WordItem(
                                            word: vocabularyList[index],
                                            index: index))));
                          })));
            }));
  }
}
