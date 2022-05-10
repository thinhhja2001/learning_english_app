import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:learning_english_app/resources/firebase_reference.dart';

class Topic {
  late String? id;
  late List<Word>? listWord;

  Topic({this.id, this.listWord});
}

class Word {
  late String? id;
  late String? topicID;
  Word({this.id, this.topicID});
}

class Scrap {
  static readJson() async {
    List worddata;
    var jsonTextWord = await rootBundle.loadString('assets/TOEIC600.json');
    worddata = json.decode(jsonTextWord);
    List<Word> wordList = [];
    for (int i = 0; i < worddata.length; i++) {
      wordList
          .add(Word(id: worddata[i]['id'], topicID: worddata[i]['topic-id']));
    }

    List topicdata;
    var jsonTextTopic = await rootBundle.loadString('assets/TOEICTOPIC.json');
    topicdata = json.decode(jsonTextTopic);
    List<Topic> topicList = [];
    for (int i = 0; i < topicdata.length; i++) {
      topicList.add(Topic(id: topicdata[i]['id']));
    }

    for (int i = 0; i < topicList.length; i++) {
      List<Word> listWord = [];
      for (int j = 0; j < wordList.length; j++) {
        if (wordList[j].topicID == topicList[i].id) {
          listWord.add(wordList[i]);
        }
      }
      topicList[i].listWord = listWord;
    }

    for (int i = 0; i < topicList.length; i++) {
      await vocabularyFR
          .doc('600TOEIC/topics/${topicList[i].id}')
          .update({'numberWord': topicList[i].listWord!.length});
    }
  }
}
