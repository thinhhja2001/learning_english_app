import 'package:cloud_firestore/cloud_firestore.dart';

class VocabularyDocument {
  late String? id;
  late String? title;
  late int? totalWord;
  late String? image;

  VocabularyDocument({this.id, this.title, this.totalWord, this.image});

  static VocabularyDocument fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return VocabularyDocument(
        id: snap.id,
        title: snapshot['title'],
        totalWord: snapshot['totalWord'],
        image: snapshot['image']);
  }
}
