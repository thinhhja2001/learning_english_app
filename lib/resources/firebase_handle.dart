import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_english_app/models/list_quiz_question.dart';

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('tests');

Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.id).toList();

  print("1");
  print(allData);

  for (var data in allData) {
    for (int i = 1; i <= 7; i++) {
      CollectionReference testFR =
          _collectionRef.doc(data.toString()).collection('part$i');
      QuerySnapshot querySnapshotTest = await testFR.get();
      final allTestData =
          querySnapshotTest.docs.map((doc) => doc.data()).toList();
      final allTestQuestionData =
          querySnapshotTest.docs.map((doc) => doc.id).toList();

      print("part $i of ${data.toString()}");
      print(allTestData);

      for (var data in allTestQuestionData) {
        QuerySnapshot querySnapshotTestDetail =
            await testFR.doc(data.toString()).collection('questions').get();
        final allTestQuestionDetailIDData =
            querySnapshotTestDetail.docs.map((doc) => doc.id).toList();
        final allTestQuestionDetailData =
            querySnapshotTestDetail.docs.map((doc) => doc.data()).toList();
        print(allTestQuestionDetailIDData);
        print(allTestQuestionDetailData);
      }
    }
  }
}

int getFirstNumber(String indexString) {
  if (indexString.contains('-')) {
    return int.parse(indexString.split('-')[0]);
  } else {
    return int.parse(indexString);
  }
}

int getLastNumber(String indexString) {
  if (indexString.contains('-')) {
    return int.parse(indexString.split('-')[1]);
  } else {
    return int.parse(indexString);
  }
}

int getLengthQuestionList(String firstIndex, String lastIndex) {
  int firstNumber = getFirstNumber(firstIndex);
  int lastNumber = getLastNumber(lastIndex);
  return lastNumber - firstNumber + 1;
}

Future<List<String>> getQuestionDocumentID(String test, String part) async {
  QuerySnapshot allListQuestionSnapshot =
      await FirebaseFirestore.instance.collection('tests/$test/$part').get();

  return allListQuestionSnapshot.docs.map((doc) => doc.id).toList();
}

Future<List<QuizQuestion>> getListQuestionDetail(
    String test, String part) async {
  List<QuizQuestion> questionsList = [];
  List<String> allListQuestionID = await getQuestionDocumentID(test, part);
  for (int i = 0; i < allListQuestionID.length; i++) {
    String document = allListQuestionID[i];
    await FirebaseFirestore.instance
        .collection('tests/$test/$part/$document/questions/')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        QuizQuestion quizQuestion = QuizQuestion.fromSnap(doc);
        print(
            "Question ${quizQuestion.id} has correct answer is ${quizQuestion.correctAnswer} ");
        questionsList.add(quizQuestion);
      }
    });
  }

  return questionsList;
}
