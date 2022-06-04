import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  late String? id;
  late String? index;
  late String? part;
  late String? test;
  late Timestamp? time;
  late String? title;

  Favorite({
    this.id,
    this.index,
    this.part,
    this.test,
    this.time,
    this.title,
  });

  static Favorite fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Favorite(
      id: snap.id,
      index: snapshot['index'] ?? "",
      part: snapshot['part'] ?? "",
      test: snapshot["test"] ?? "",
      time: snapshot["time"] ?? "",
      title: snapshot["title"] ?? "",
    );
  }
}
