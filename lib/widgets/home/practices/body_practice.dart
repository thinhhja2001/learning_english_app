// import 'package:accordion/accordion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/widgets/custom/accordion.dart';
import 'package:learning_english_app/widgets/home/practices/list_answer_widget.dart';

import '../../../models/practice/answer.dart';

class ExpansionPanelCustomAnswers extends StatelessWidget {
  final Answer answer;

  const ExpansionPanelCustomAnswers({Key? key, required this.answer})
      : super(key: key);

  bool isIncludeNumber(String s) {
    if (s.isEmpty) {
      return false;
    }
    String checkString = s.substring(0, 3);
    if (checkString.contains(RegExp(r'[0-9]'))) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Accordion(
        header: Text(
            isIncludeNumber(answer.question!)
                ? answer.question!
                : "${answer.id!}. ${answer.question!}",
            style: const TextStyle(color: Colors.white, fontSize: 17)),
        content: ListAnswerWidget(
          isShowAnswer: false,
          answers: [
            answer.answerA!,
            answer.answerB!,
            answer.answerC!,
            answer.answerD!,
          ],
          correctAnswerIndex: answer.correctAnswer!,
          index: int.parse(answer.id!),
        ));
  }
}

// class ExpansionPanelCustomQuestion extends StatelessWidget {
//   final String script;
//   final String id;

//   const ExpansionPanelCustomQuestion(
//       {Key? key, required this.script, required this.id})
//       : super(key: key);

//   bool isScriptImage(String script) {
//     return script.contains('http') ? true : false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Accordion(
//         headerBackgroundColor: Colors.green,
//         header: const Text('Press release',
//             style: TextStyle(color: Colors.white, fontSize: 17)),
//         content: Text("${data['script']}"),
//       ),
//     ]);
//   }
// }

class CustomPicture extends StatelessWidget {
  final String imageUrl;

  const CustomPicture({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.contain),
    );
  }
}
