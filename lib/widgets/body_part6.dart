import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/widgets/list_answer_widget.dart';

class ExpansionPanelCustomAnswers extends StatelessWidget {
  final String documentId;

  ExpansionPanelCustomAnswers(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference answers = FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .doc('131-134')
        .collection("questions");

    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Accordion(
            paddingListTop: 0,
            paddingListBottom: 0,
            children: [
              AccordionSection(
                isOpen: true,
                header: Text(documentId,
                    style: TextStyle(color: Colors.white, fontSize: 17)),
                content: Text("Something went wrong"),
              ),
            ],
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data);
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
            paddingListTop: 10,
            paddingListBottom: 0,
            children: [
              AccordionSection(
                  isOpen: true,
                  header: Text(documentId,
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
                  )
                  // Text(
                  //     "A: ${data['A']}\nB: ${data['B']}\nC: ${data['C']}\nD: ${data['D']}"),
                  ),
            ],
          );
        }

        return Accordion(
          paddingListTop: 10,
          paddingListBottom: 0,
          children: [
            AccordionSection(
              isOpen: true,
              header: Text(documentId,
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: Text("Loading"),
            ),
          ],
        );
      },
    );
  }
}

class ExpansionPanelCustomQuestion extends StatelessWidget {
  final String documentId;

  ExpansionPanelCustomQuestion(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference answers = FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6");

    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Accordion(
            headerBackgroundColor: Colors.green,
            paddingListTop: 0,
            paddingListBottom: 0,
            children: [
              AccordionSection(
                isOpen: true,
                header: Text(documentId,
                    style: TextStyle(color: Colors.white, fontSize: 17)),
                content: Text("Something went wrong"),
              ),
            ],
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
              paddingListTop: 10,
              paddingListBottom: 0,
              children: [
                AccordionSection(
                  isOpen: true,
                  header: Text('Press release',
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  content: Text("${data['script']}"),
                ),
              ],
            ),
          ]);
          //   child:
          //     Accordion(
          //   paddingListTop: 10,
          //   paddingListBottom: 0,
          //   children: [
          //     AccordionSection(
          //         isOpen: true,
          //         header: Text(documentId,
          //             style: TextStyle(color: Colors.white, fontSize: 17)),
          //         content: ListAnswerWidget(
          //           isShowAnswer: false,
          //           answers: [
          //             "${data['A']}",
          //             "${data['B']}",
          //             "${data['C']}",
          //             "${data['D']}"
          //           ],
          //           correctAnswerIndex: correctAnswerIndex,
          //         )
          //         // Text(
          //         //     "A: ${data['A']}\nB: ${data['B']}\nC: ${data['C']}\nD: ${data['D']}"),
          //         ),
          //   ],
          // );
        }

        return Accordion(
          headerBackgroundColor: Colors.green,
          paddingListTop: 10,
          paddingListBottom: 0,
          children: [
            AccordionSection(
              isOpen: true,
              header: Text(documentId,
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: Text("Loading"),
            ),
          ],
        );
      },
    );
  }
}
