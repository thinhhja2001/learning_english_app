// import 'package:accordion/accordion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/widgets/accordion.dart';
import 'package:learning_english_app/widgets/list_answer_widget.dart';

class ExpansionPanelCustomAnswers extends StatelessWidget {
  final String documentId;
  final String questionId;
  final String testId;
  final String part;

  ExpansionPanelCustomAnswers(
      {Key? key,
      required this.documentId,
      required this.testId,
      required this.part,
      required this.questionId});

  @override
  Widget build(BuildContext context) {
    CollectionReference answers = FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .doc(documentId)
        .collection("questions");
    // print(testId + "\t" + part + "\t" + documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(questionId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Accordion(
            header: Text(questionId,
                style: TextStyle(color: Colors.white, fontSize: 17)),
            content: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          try {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // print(data);
            int correctAnswerIndex;
            switch ("${data['Answer']}") {
              case "A":
                correctAnswerIndex = 0;
                break;
              case "B":
                correctAnswerIndex = 1;
                break;
              case "C":
                correctAnswerIndex = 2;
                break;
              case "D":
                correctAnswerIndex = 3;
                break;
              default:
                correctAnswerIndex = -1;
                break;
            }
            var answers = <String>[
              "${data['A']}",
              "${data['B']}",
              "${data['C']}",
              "${data['D']}"
            ];
            return Accordion(
                header: Text(questionId,
                    style: TextStyle(color: Colors.white, fontSize: 17)),
                content: ListAnswerWidget(
                  isShowAnswer: false,
                  answers: [
                    "${data['A']}",
                    "${data['B']}",
                    "${data['C']}",
                    "${data['D']}"
                  ],
                  correctAnswerIndex: correctAnswerIndex,
                ));
          } catch (e) {
            print(e);
          }
          return Accordion(
            header: Text(questionId,
                style: TextStyle(color: Colors.white, fontSize: 17)),
            content: Text("Something went wrong"),
          );
        }

        return Accordion(
          header: Text(questionId,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          content: Text("Loading"),
        );
      },
    );
  }
}

class ExpansionPanelCustomQuestion extends StatelessWidget {
  final String documentId;
  final String testId;
  final String part;

  ExpansionPanelCustomQuestion(
      {Key? key,
      required this.documentId,
      required this.testId,
      required this.part});

  @override
  Widget build(BuildContext context) {
    CollectionReference answers = FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part);

    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Accordion(
            headerBackgroundColor: Colors.green,
            header: Text(documentId,
                style: TextStyle(color: Colors.white, fontSize: 17)),
            content: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Text.rich(
                TextSpan(
                  text: 'Question ' + documentId + " ",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "${data['descript']}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Accordion(
              headerBackgroundColor: Colors.green,
              header: Text('Press release',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: Text("${data['script']}"),
            ),
          ]);
        }

        return Accordion(
          headerBackgroundColor: Colors.green,
          header: Text(documentId,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          content: Text("Loading"),
        );
      },
    );
  }
}

class CustomPicture extends StatelessWidget {
  final String documentId;
  final String testId;
  final String part;

  CustomPicture(
      {Key? key,
      required this.documentId,
      required this.testId,
      required this.part});

  @override
  Widget build(BuildContext context) {
    CollectionReference answers = FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .doc(documentId)
        .collection("questions");
    ;

    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Accordion(
            headerBackgroundColor: Colors.green,
            header: Text(documentId,
                style: TextStyle(color: Colors.white, fontSize: 17)),
            content: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("${data['imageUrl']}");
          return Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${data['imageUrl']}"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
          );
        }

        return Accordion(
          headerBackgroundColor: Colors.green,
          header: Text(documentId,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          content: Text("Loading"),
        );
      },
    );
  }
}
