import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteWord {
  late String? id;
  late String? wordId;
  late String? topicId;
  late String? docId;
  late String? word;
  late String? type;
  late String? meaning;
  late DateTime? time;

  FavoriteWord(
      {this.id,
      this.wordId,
      this.topicId,
      this.docId,
      this.word,
      this.type,
      this.meaning,
      this.time});

  static FavoriteWord fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FavoriteWord(
      id: snap.id,
      wordId: snapshot['wordId'],
      topicId: snapshot['topicID'],
      docId: snapshot['docID'],
      word: snapshot['word'],
      meaning: snapshot['meaning'],
      type: snapshot['type'],
      time: snapshot['time'].toDate(),
    );
  }
}
