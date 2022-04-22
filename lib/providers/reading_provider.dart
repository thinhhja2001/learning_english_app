import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadingProvider extends ChangeNotifier {
  var scripts = <String>[];
  DocumentSnapshot? snapshot = null; //Define snapshot
  void getData() async {
    // Web.
//     await FirebaseFirestore.instance.enablePersistence();

// // All other platforms.
//     FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .doc('131-134')
        .get(); //get the data
    snapshot = data;

    snapshot?.data().toString();
    // print(snapshot!.data().toString());
    FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .doc('131-134')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document exists on the database');
        // print('Document data: ${documentSnapshot.data()}');
      }
    });
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
