import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String _email;
  late final String _name;
  late final String _uid;
  late final int _timeUsed;
  UserData(
      {required String email,
      required String name,
      required String uid,
      required int timeUsed}) {
    _email = email;
    _name = name;
    _uid = uid;
    _timeUsed = timeUsed;
  }

  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  int get timeUsed => _timeUsed;
  Map<String, dynamic> toJson() =>
      {'email': _email, 'name': _name, 'uid': _uid};
  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserData(
        email: snapshot['email'],
        name: snapshot['name'],
        uid: snapshot['uid'],
        timeUsed: snapshot['timeUsed']);
  }
}
