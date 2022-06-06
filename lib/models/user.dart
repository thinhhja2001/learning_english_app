// ignore_for_file: prefer_final_fields, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String _email;
  late final String _name;
  late final String _uid;
  late final String _avatarURL;
  UserData({
    required String email,
    required String name,
    required String uid,
    required String avatarURL,
  }) {
    _email = email;
    _name = name;
    _uid = uid;
    _avatarURL = avatarURL;
  }

  String get email => _email;
  String get name => _name;
  String get uid => _uid;
  String get avatarURL => _avatarURL;
  Map<String, dynamic> toJson() =>
      {'email': _email, 'name': _name, 'uid': _uid, 'avatarURL': _avatarURL};
  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserData(
      email: snapshot['email'],
      name: snapshot['name'],
      uid: snapshot['uid'],
      avatarURL: snapshot['avatarURL'],
    );
  }
}
