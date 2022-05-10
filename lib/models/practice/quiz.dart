import 'package:cloud_firestore/cloud_firestore.dart';

import 'answer.dart';

class Quiz {
  late String? id;
  late String? audioUrl;
  late String? imageUrl;
  late String? script;
  late String? script1;
  late String? script2;
  late List<Answer>? listAnswer;

  Quiz(
      {this.id,
      this.audioUrl,
      this.imageUrl,
      this.script,
      this.script1,
      this.script2,
      this.listAnswer});

  static Quiz fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Quiz(
        id: snap.id,
        audioUrl: snapshot['audioUrl'] ?? "",
        imageUrl: snapshot['imageUrl'] ?? "",
        script: snapshot["script"] ?? "",
        script1: snapshot["script1"] ?? "",
        script2: snapshot["script2"] ?? "",
        listAnswer: []);
  }
}
