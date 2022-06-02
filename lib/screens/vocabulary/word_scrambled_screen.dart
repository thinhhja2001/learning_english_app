// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';

import 'package:learning_english_app/utils/constants.dart';

class WordScrambleScreen extends StatefulWidget {
  const WordScrambleScreen(
      {Key? key, required this.listVocabulary, required this.topic})
      : super(key: key);
  final List<Vocabulary> listVocabulary;
  final String topic;

  @override
  State<WordScrambleScreen> createState() => _WordScrambleScreenState();
}

class _WordScrambleScreenState extends State<WordScrambleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 60,
            titleSpacing: 0,
            leading: const BackButton(color: Colors.black),
            title: Text.rich(
              TextSpan(text: "Scramble Word about ", children: <TextSpan>[
                TextSpan(
                    text: widget.topic,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ]),
              style: TextStyle(color: Colors.black),
            )),
        body: ScrambleQuizWidget(listVocabulary: widget.listVocabulary));
  }
}

class ScrambleQuizWidget extends StatefulWidget {
  const ScrambleQuizWidget({
    Key? key,
    required this.listVocabulary,
  }) : super(key: key);
  final List<Vocabulary> listVocabulary;

  @override
  State<ScrambleQuizWidget> createState() => _ScrambleQuizWidgetState();
}

class _ScrambleQuizWidgetState extends State<ScrambleQuizWidget> {
  var numQuestion = 0;
  var totalQuestion = 0;
  var totalCorrectAnswer = 0;
  var score = 0.0;
  var scrambleWord = "";
  var answerWord = "";
  var meaning = "";
  bool isSubmit = false;
  bool isCorrect = false;
  bool showResult = false;
  TextEditingController answerController = TextEditingController();

  @override
  initState() {
    super.initState();
    initQuiz();
    getNewQuestion(numQuestion);
  }

  initQuiz() {
    widget.listVocabulary.shuffle();
    totalQuestion = widget.listVocabulary.length;
    numQuestion = 0;
    score = 0;
    scrambleWord = "";
    answerWord = "";
    meaning = "";
    isCorrect = false;
    isSubmit = false;
    showResult = false;
  }

  getNewQuestion(int num) {
    List<Characters> charList = [];
    String currentWord = widget.listVocabulary[num].word!;
    String newWord = "";

    for (int i = 0; i < currentWord.length; i++) {
      charList.add(currentWord[i].characters);
    }
    do {
      charList.shuffle();
      for (int i = 0; i < charList.length; i++) {
        newWord += charList[i].toString();
      }
    } while (newWord == currentWord);

    meaning = widget.listVocabulary[num].meaning!;
    answerWord = currentWord;
    scrambleWord = newWord;
  }

  updateNextQuestion() {
    if (numQuestion == totalQuestion - 1) {
      setState(() {
        showResult = true;
      });
    } else {
      setState(() {
        answerController.text = "";
        numQuestion++;
        getNewQuestion(numQuestion);
        isSubmit = false;
      });
    }
  }

  submit() {
    setState(() {
      isSubmit = true;
      if (answerWord == answerController.text) {
        isCorrect = true;
        score += caculateScore();
        totalCorrectAnswer++;
      } else {
        isCorrect = false;
      }
    });
  }

  caculateScore() {
    if (answerWord.length > 15) {
      return 20.0;
    } else if (answerWord.length > 10) {
      return 15.0;
    } else {
      return 10.0;
    }
  }

  resetQuiz() {
    setState(() {
      initQuiz();
      getNewQuestion(numQuestion);
    });
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return showResult
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 60),
            child: Center(
              child: Column(children: [
                Center(
                    child: Text("Result",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))),
                verticalSpaceMedium,
                Center(
                    child: Text("$score",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.green))),
                verticalSpaceMedium,
                Center(
                    child: Text("$totalCorrectAnswer / $totalQuestion",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))),
                verticalSpaceLarge,
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 8,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 2, 50),
                          side: BorderSide(width: 1, color: Colors.grey)),
                      onPressed: resetQuiz,
                      child: Text(
                        "Retry the Quiz",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                )
              ]),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${numQuestion + 1} of $totalQuestion words",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Score: $score",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                verticalSpaceLarge,
                Center(
                  child: Text(
                    scrambleWord,
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
                  ),
                ),
                verticalSpaceMedium,
                Center(
                  child: Text(
                    "Unscramble the word using all the letters",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                verticalSpaceMedium,
                TextField(
                  enabled: !isSubmit,
                  controller: answerController,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: isSubmit
                          ? isCorrect
                              ? Colors.green
                              : Colors.red
                          : Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: isCorrect
                              ? BorderSide(color: Colors.green)
                              : BorderSide(color: Colors.red)),
                      suffixIcon: isSubmit
                          ? isCorrect
                              ? Icon(Icons.check_circle,
                                  color: Colors.green, size: 32)
                              : Icon(Icons.cancel, color: Colors.red, size: 32)
                          : null),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 8,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width / 2,
                                      50),
                                  side:
                                      BorderSide(width: 1, color: Colors.grey)),
                              onPressed: updateNextQuestion,
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        )),
                    horizontalSpaceTiny,
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: isSubmit
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      elevation: 8,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width / 2,
                                          50),
                                      side: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  onPressed: updateNextQuestion,
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      elevation: 8,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width / 2,
                                          50),
                                      side: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  onPressed: submit,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                        )),
                  ],
                ),
                verticalSpaceLarge,
                isSubmit
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            answerWord,
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.normal,
                                color: isCorrect ? Colors.green : Colors.red),
                          ),
                          verticalSpaceSmall,
                          Text(
                            meaning,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: isCorrect ? Colors.green : Colors.red),
                          ),
                        ],
                      )
                    : SizedBox(),
                verticalSpaceMedium,
              ]),
            ),
          );
  }
}
