import 'package:cloud_firestore/cloud_firestore.dart';

class VocabularyTopic {
  late String? id;
  late String? title;
  late String? meaning;
  late String? image;
  late int? numberWord;

  VocabularyTopic(
      {this.id, this.title, this.meaning, this.image, this.numberWord});

  static List<VocabularyTopic> dataListFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return VocabularyTopic(
          id: snapshot.id,
          title: dataMap['title'],
          meaning: dataMap['meaning'],
          image: dataMap['imageUrl'],
          numberWord: dataMap['numberWord']);
    }).toList();
  }

  static VocabularyTopic fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return VocabularyTopic(
        id: snap.id,
        title: snapshot['title'],
        meaning: snapshot['meaning'],
        image: snapshot['imageUrl'],
        numberWord: snapshot['numberWord']);
  }
}
