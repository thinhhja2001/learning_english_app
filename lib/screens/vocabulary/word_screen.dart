// ignore_for_file: avoid_print, prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/widgets/home/vocabulary/speech_audio_widget.dart';

import '../../resources/firebase_reference.dart';

class WordScreen extends StatefulWidget {
  const WordScreen(
      {Key? key,
      required this.wordId,
      required this.topicId,
      required this.docId,
      required this.wordName})
      : super(key: key);
  final String wordId;
  final String topicId;
  final String docId;
  final String wordName;

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String capitalizeWord(String s) {
    String newsString = "";
    List splitString = s.split(" ");
    for (String split in splitString) {
      newsString = newsString + capitalize(split) + " ";
    }
    return newsString;
  }

  String fixString(String s) {
    String newsString = "";
    List splitString = s.split(" ");
    for (String split in splitString) {
      if (split.isNotEmpty) {
        newsString = newsString + split + " ";
      }
    }
    return newsString;
  }

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {Get.back()},
            color: Colors.black),
        centerTitle: true,
        title: Text(capitalizeWord(widget.wordName),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<Vocabulary>(
          future: FirebaseHandler.getVocabulary(
              widget.docId, widget.topicId, widget.wordId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text("Something Error"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.black));
            }
            Vocabulary word = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    ClipRRect(
                      child: Image.network(
                        word.imageUrl!,
                        height: 256,
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            capitalizeWord(word.word!),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color.fromRGBO(14, 167, 129, 1)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SpeechAudioWidget(audioUrl: word.audioUrl!),
                              StreamBuilder(
                                stream: userFR
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection("wordFavorites")
                                    .where("wordId", isEqualTo: word.id)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.data == null) {
                                    return Text("");
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: IconButton(
                                        onPressed: () =>
                                            snapshot.data.docs.length == 0
                                                ? addToFavorite(
                                                    word.id!,
                                                    word.word!,
                                                    word.meaning!,
                                                    word.type!,
                                                    widget.docId,
                                                    widget.topicId)
                                                : deleteFromFavorite(word.id!),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(children: [
                        Text(
                          word.type!,
                          style: TextStyle(
                              color: Color.fromRGBO(14, 167, 129, 1),
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          word.spell!,
                          style: TextStyle(
                              fontFamily: 'Calibri',
                              color: Colors.grey[600],
                              letterSpacing: 1,
                              fontSize: 20),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        fixString(word.define!),
                        style: TextStyle(
                            color: Colors.grey[600],
                            letterSpacing: 1,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_right_outlined,
                              color: Color.fromRGBO(14, 167, 129, 1)),
                          Text(
                            "Ý nghĩa",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(14, 167, 129, 1),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        fixString(word.meaning!),
                        style: TextStyle(
                            color: Colors.grey[600],
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_right_outlined,
                              color: Color.fromRGBO(14, 167, 129, 1)),
                          Text(
                            "Ví dụ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(14, 167, 129, 1),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "- ${fixString(word.exampleEN!)}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey[600], height: 1.4, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "=>  ${fixString(word.exampleVN!)}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey[600], height: 1.4, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
