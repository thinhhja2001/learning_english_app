// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/providers/vocabulary/vocaublary_provider.dart';
import 'package:learning_english_app/widgets/home/vocabulary/topic_item.dart';
import 'package:provider/provider.dart';

import '../../models/vocabulary/vocabulary_document.dart';
import '../../resources/firebase_handle.dart';
import '../../widgets/home/vocabulary/appbar_vocabulary.dart';

class TopicListScreen extends StatefulWidget {
  const TopicListScreen({Key? key}) : super(key: key);

  @override
  _TopicListState createState() => _TopicListState();
}

class _TopicListState extends State<TopicListScreen> {
  List<VocabularyTopic> topicList = [];
  @override
  Widget build(BuildContext context) {
    final VocabularyProvider _vocabularyProvider =
        Provider.of<VocabularyProvider>(context);
    final VocabularyDocument _document = _vocabularyProvider.document;
    return Scaffold(
        appBar: AppBarVocabularyList(
            title: _document.title!,
            imageSource: _document.image!,
            totalWord: _document.totalWord!),
        body: FutureBuilder<List<VocabularyTopic>>(
            future: FirebaseHandler.getVocabularyTopicList(_document.id!),
            builder: (BuildContext context,
                AsyncSnapshot<List<VocabularyTopic>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Something Error"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.black));
              }
              topicList = snapshot.data!.map((doc) => doc).toList();
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: AnimationLimiter(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.8,
                                  mainAxisSpacing: 10),
                          itemCount: topicList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredGrid(
                                columnCount: 1,
                                position: index,
                                duration: Duration(milliseconds: 1000),
                                child: ScaleAnimation(
                                    child: FadeInAnimation(
                                        delay: Duration(milliseconds: 100),
                                        child: TopicItem(
                                            topic: topicList[index]))));
                          })));
            }));
  }
}
