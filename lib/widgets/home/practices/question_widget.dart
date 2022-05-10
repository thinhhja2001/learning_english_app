// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice/answer.dart';
import 'package:learning_english_app/models/practice/practice.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/models/practice/quiz.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:provider/provider.dart';

import '../../../resources/firebase_handle.dart';
import '../../../resources/firebase_reference.dart';
import '../../../utils/constants.dart';
import '../../body_practice.dart';
import 'audio_player_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.index,
    required this.nextQuestion,
    required this.previousQuestion,
  }) : super(key: key);

  final int index;
  final VoidCallback nextQuestion;
  final VoidCallback previousQuestion;

  bool isListeningTest(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return true;
    } else {
      return false;
    }
  }

  Future addToFavorite(
      String test, String part, String index, String title) async {
    await FirebaseHandler.addToFavorite(test, part, index, title);
  }

  Future deleteFavorite(String test, String part, String index) async {
    await FirebaseHandler.deleteFromFavorite(test, part, index);
  }

  @override
  Widget build(BuildContext context) {
    PageQuizProvider pageQuizProvider = Provider.of<PageQuizProvider>(context);

    final PracticeFile practiceFile = pageQuizProvider.practiceFile;
    final String test = practiceFile.id!;
    final String part = practiceFile.practice.practicePart.name;
    final String title = practiceFile.fileTitle!;
    final Quiz quiz = pageQuizProvider.listQuiz[index];
    final String indexQuiz = quiz.id!;
    final Practice practice = pageQuizProvider.practiceFile.practice;
    List<Answer> answerList = quiz.listAnswer!;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(children: [
            quiz.imageUrl!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.imageUrl!),
            quiz.script!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script!),
            quiz.script1!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script1!),
            quiz.script2!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script2!),
            for (Answer answer in answerList)
              ExpansionPanelCustomAnswers(answer: answer)
          ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: kDefaultBorderRadius,
                    topRight: kDefaultBorderRadius)),
            child: Column(
              children: [
                isListeningTest(practice.practiceType)
                    // true
                    ? AudioPlayerWidget(
                        audioUrl: quiz.audioUrl!, isRemote: true)
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: index > 0 ? previousQuestion : () {},
                        icon: Icon(Icons.arrow_back)),
                    StreamBuilder(
                        stream: userFR
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("favorites")
                            .doc(test)
                            .collection(part)
                            .where("index", isEqualTo: indexQuiz)
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Text("");
                          }
                          return IconButton(
                            onPressed: () => snapshot.data.docs.length == 0
                                ? addToFavorite(test, part, indexQuiz, title)
                                : deleteFavorite(test, part, indexQuiz),
                            icon: snapshot.data.docs.length == 0
                                ? Icon(
                                    Icons.favorite_outline,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  ),
                          );
                        }),
                    IconButton(
                        onPressed: nextQuestion,
                        icon: Icon(Icons.arrow_forward)),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
