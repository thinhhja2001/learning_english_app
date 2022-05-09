// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_english_app/models/list_quiz_question.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/models/practice_file.dart';
import 'package:learning_english_app/models/result.dart';
import 'package:learning_english_app/models/user.dart';
import 'package:learning_english_app/resources/firebase_reference.dart';

import '../models/answer.dart';
import '../models/quiz.dart';
import 'auth_methods.dart';

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('tests');

Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.id).toList();

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

class SupportFunction {
  static int getFirstNumber(String indexString) {
    if (indexString.contains('-')) {
      return int.parse(indexString.split('-')[0]);
    } else {
      return int.parse(indexString);
    }
  }

  static int getLastNumber(String indexString) {
    if (indexString.contains('-')) {
      return int.parse(indexString.split('-')[1]);
    } else {
      return int.parse(indexString);
    }
  }

  static int getLengthQuestionList(String firstIndex, String lastIndex) {
    int firstNumber = getFirstNumber(firstIndex);
    int lastNumber = getLastNumber(lastIndex);
    return lastNumber - firstNumber + 1;
  }

  static int convertAnswerToInt(String answerString) {
    switch (answerString) {
      case "A":
        return 0;
      case "B":
        return 1;
      case "C":
        return 2;
      case "D":
        return 3;
      default:
        return -1;
    }
  }
}

class FirebaseHandler {
  // Get List Document ID from FireStone (tests/test#/part#/)
  static Future<List<String>> getQuestionDocumentID(
      String test, String part) async {
    QuerySnapshot allListQuestionSnapshot =
        await FirebaseFirestore.instance.collection('tests/$test/$part').get();

    return allListQuestionSnapshot.docs.map((doc) => doc.id).toList();
  }

  // Get List Document from Colection
  static getListQuiz1(String test, String part) async {
    CollectionReference quizFR = testFR.doc(test).collection(part);
    return await quizFR.get();
  }

  // Get List Question from Question Document
  static Future<List<QuizQuestion>> getListQuestionDetailForSumary(
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
          questionsList.add(quizQuestion);
        }
      });
    }

    return questionsList;
  }

  // Get List Test from FireStore
  static Future<List<PracticeFile>> getListTest(Practice practice) async {
    List<PracticeFile> practiceFileList = [];
    QuerySnapshot testQuerySnapshot = await testFR.get();
    practiceFileList = testQuerySnapshot.docs
        .map((doc) => PracticeFile.fromFireStore(doc.id, practice))
        .toList();

    return practiceFileList;
  }

  // Get List Question from Question Document
  static Future<List<Answer>> getListAnswer(
      String test, String part, String document) async {
    List<Answer> answerList = [];
    QuerySnapshot answerQuerySnapshot =
        await testFR.doc(test).collection("$part/$document/questions").get();

    answerList =
        answerQuerySnapshot.docs.map((doc) => Answer.fromSnap(doc)).toList();

    return answerList;
  }

  static Future<List<Quiz>> getListQuiz(String test, String part) async {
    List<Quiz> quizList = [];
    QuerySnapshot quizQuerySnapshot =
        await testFR.doc(test).collection(part).get();
    quizList = quizQuerySnapshot.docs.map((doc) => Quiz.fromSnap(doc)).toList();

    for (int i = 0; i < quizList.length; i++) {
      List<Answer> listAnswer =
          await getListAnswer(test, part, quizList[i].id!);
      quizList[i].listAnswer = listAnswer;
    }
    return quizList;
  }

  // Get Number Question of part from test
  static Future<int> getAllQuestion(String test, String part) async {
    List<String> allListQuestionID = await getQuestionDocumentID(test, part);
    int numberQuestion = 0;
    for (int i = 0; i < allListQuestionID.length; i++) {
      String document = allListQuestionID[i];
      await FirebaseFirestore.instance
          .collection('tests/$test/$part/$document/questions/')
          .get()
          .then((QuerySnapshot querySnapshot) {
        numberQuestion += querySnapshot.docs.length;
      });
    }
    return numberQuestion;
  }

  static Future<User> getCurrentUser() async =>
      await AuthMethods().getUserDetails().then((data) {
        return User(email: data.email, name: data.name, uid: data.uid);
      });

  static addResultToFirebase(String test, String part, Result result) async {
    User user = await getCurrentUser();
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

    return await userFR
        .doc(user.uid)
        .collection('results')
        .doc(test)
        .collection(part)
        .add({
          'numUnSelect': result.numberUnSelect,
          'numCorrect': result.numberCorrect,
          'numInCorrect': result.numberInCorrect,
          'answerlist': result.correctList,
          'chooseList': result.chooseList,
          'time': myTimeStamp
        })
        .then((value) => print("Add Result ${value.id} successfull"))
        .catchError((error) => print("Failed to update Result: $error"));
  }

  static addToFavorite(
      String test, String part, String index, String title) async {
    User user = await getCurrentUser();
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
    return await userFR
        .doc(user.uid)
        .collection('favorites')
        .doc(test)
        .collection(part)
        .add({'title': title, 'index': index, 'time': myTimeStamp})
        .then((value) => print("Add Favorite ${value.id} successfull"))
        .catchError((error) => print("Failed to update favorite: $error"));
  }

  static deleteFromFavorite(String test, String part, String index) async {
    User user = await getCurrentUser();
    CollectionReference favoriteFR =
        userFR.doc(user.uid).collection('favorites').doc(test).collection(part);
    List<String> listID = [];
    await favoriteFR
        .where('index', isEqualTo: index)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listID.add(doc.id);
      }
    });
    return favoriteFR.doc(listID.first).delete().then((value) {
      print("Delete Favorite $index successful");
    }).catchError((error) => print('Failed to Delete news: $error'));
  }
}
