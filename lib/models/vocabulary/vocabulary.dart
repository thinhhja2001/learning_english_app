import 'package:cloud_firestore/cloud_firestore.dart';

class Vocabulary {
  late String? id;
  late String? define;
  late String? meaning;
  late String? imageUrl;
  late String? spell;
  late String? type;
  late String? word;
  late String? audioUrl;
  late String? exampleEN;
  late String? exampleVN;

  Vocabulary(
      {this.id,
      this.word,
      this.spell,
      this.type,
      this.define,
      this.meaning,
      this.imageUrl,
      this.audioUrl,
      this.exampleEN,
      this.exampleVN});

  static List<Vocabulary> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return Vocabulary(
          id: snapshot.id,
          word: dataMap['word'],
          spell: dataMap['spell'],
          type: dataMap['type'],
          define: dataMap['definite'],
          meaning: dataMap['meaning'],
          imageUrl: dataMap['imageUrl'],
          audioUrl: dataMap['audioUrl'],
          exampleEN: dataMap['exampleEN'],
          exampleVN: dataMap['exampleVN']);
    }).toList();
  }

  static Vocabulary fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Vocabulary(
        id: snap.id,
        word: snapshot['word'],
        spell: snapshot['spell'],
        type: snapshot['type'],
        define: snapshot['definite'],
        meaning: snapshot['meaning'],
        imageUrl: snapshot['imageUrl'],
        audioUrl: snapshot['audioUrl'],
        exampleEN: snapshot['exampleEN'],
        exampleVN: snapshot['exampleVN']);
  }
}
