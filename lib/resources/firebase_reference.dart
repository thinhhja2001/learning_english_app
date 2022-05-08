import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fi = FirebaseFirestore.instance;

//FR - firestore reference

final userFR = fi.collection('users');
final testFR = fi.collection('tests');

//Reference get firebaseStorage => FirebaseStorage.instanceFor(bucket: 'gs://learning-english-app.appspot.com').ref();
FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
