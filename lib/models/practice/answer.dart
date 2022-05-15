import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/resources/support_function.dart';

class Answer {
  late String? id;
  late String? answerA;
  late String? answerB;
  late String? answerC;
  late String? answerD;
  late String? question;
  late int? correctAnswer;

  Answer(
      {this.id,
      this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.question,
      this.correctAnswer});

  static Answer fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Answer(
      id: snap.id,
      answerA: snapshot['A'] ?? "",
      answerB: snapshot['B'] ?? "",
      answerC: snapshot['C'] ?? "",
      answerD: snapshot['D'] ?? "",
      question: snapshot['Question'] ?? "",
      correctAnswer:
          SupportFunction.convertAnswerToInt(snapshot['correctAnswer'] ?? ""),
    );
  }

  static List<Answer> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return Answer(
        id: snapshot.id,
        answerA: dataMap['A'] ?? "",
        answerB: dataMap['B'] ?? "",
        answerC: dataMap['C'] ?? "",
        answerD: dataMap['D'] ?? "",
        question: dataMap['Question'] ?? "",
        correctAnswer:
            SupportFunction.convertAnswerToInt(snapshot['correctAnswer'] ?? ""),
      );
    }).toList();
  }
}
