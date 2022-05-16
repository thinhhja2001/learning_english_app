// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_english_app/models/practice/answer.dart';
import 'package:learning_english_app/models/practice/list_quiz_question.dart';
import 'package:learning_english_app/models/practice/practice.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/models/practice/quiz.dart';
import 'package:learning_english_app/models/practice/result.dart';
import 'package:learning_english_app/models/user.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/resources/firebase_reference.dart';
import 'package:learning_english_app/resources/support_function.dart';
import 'package:learning_english_app/utils/constants.dart';

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
    if (practice.practicePart == PracticePart.part7) {
      practiceFileList.removeWhere((element) =>
          element.id == 'test6' ||
          element.id == 'test7' ||
          element.id == 'test8');
    }
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

  static Future<UserData> getCurrentUser() async =>
      await AuthMethods().getUserDetails().then((data) {
        return UserData(email: data.email, name: data.name, uid: data.uid);
      });

  static addResultToFirebase(String test, String part, Result result) async {
    UserData user = await getCurrentUser();
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

    Map<String, Object> dummyMap = {};
    DocumentReference df =
        await userFR.doc(user.uid).collection('results').doc(test);
    df.set(dummyMap);
    return await userFR
        .doc(user.uid)
        .collection('results')
        .doc(test)
        .collection(part)
        .add({
          'numUnSelect': result.numberUnSelect,
          'numCorrect': result.numberCorrect,
          'numInCorrect': result.numberInCorrect,
          'answerList': result.correctList,
          'chooseList': result.chooseList,
          'time': myTimeStamp
        })
        .then((value) => print("Add Result ${value.id} successfully"))
        .catchError((error) => print("Failed to update Result: $error"));
  }

  static Future<int> estimateListening() async {
    UserData user = await getCurrentUser();
    List testListID = [];
    List<Result> results = [];
    int numberCorrect = 0, numberInCorrect = 0, numberUnSelect = 0;
    List lPart = ['part1', 'part2', 'part3', 'part4'];
    List lPartScore = [0, 0, 0, 0];
    QuerySnapshot testSnapshot =
        await userFR.doc(user.uid).collection('results').get();
    testListID = testSnapshot.docs.map((doc) => doc.id).toList();
    for (var id in testListID) {
      for (String part in lPart) {
        testSnapshot = await userFR
            .doc(user.uid)
            .collection('results')
            .doc(id)
            .collection(part)
            .get();
        results =
            testSnapshot.docs.map((doc) => Result.fromSnap(snap: doc)).toList();
        if (results.isNotEmpty) {
          results.sort((a, b) => a.time!.compareTo(b.time!));
          print(results);
          numberCorrect += results.last.numberCorrect;
          numberInCorrect += results.last.numberInCorrect;
          numberUnSelect += results.last.numberUnSelect;
          lPartScore[
              int.parse(part.substring(part.length - 1, part.length)) - 1]++;
        }
      }
    }
    if (numberCorrect == 0)
      return 5;
    else
      return SupportFunction.roundNumberTo5(
          (numberCorrect / (numberInCorrect + numberUnSelect + numberCorrect)) *
              (lPartScore[0] * 30 +
                  lPartScore[1] * 105 +
                  lPartScore[2] * 245 +
                  lPartScore[3] * 115));
  }

  static Future<int> estimateReading() async {
    UserData user = await getCurrentUser();
    List testListID = [];
    List<Result> results = [];
    int numberCorrect = 0, numberInCorrect = 0, numberUnSelect = 0;
    List lPart = ['part5', 'part6', 'part7'];
    List lPartScore = [0, 0, 0];
    QuerySnapshot testSnapshot =
        await userFR.doc(user.uid).collection('results').get();
    testListID = testSnapshot.docs.map((doc) => doc.id).toList();
    for (var id in testListID) {
      for (String part in lPart) {
        testSnapshot = await userFR
            .doc(user.uid)
            .collection('results')
            .doc(id)
            .collection(part)
            .get();
        results =
            testSnapshot.docs.map((doc) => Result.fromSnap(snap: doc)).toList();
        if (results.isNotEmpty) {
          results.sort((a, b) => a.time!.compareTo(b.time!));
          print(results);
          numberCorrect += results.last.numberCorrect;
          numberInCorrect += results.last.numberInCorrect;
          numberUnSelect += results.last.numberUnSelect;
          lPartScore[
              int.parse(part.substring(part.length - 1, part.length)) - 5]++;
        }
      }
    }
    if (numberCorrect == 0)
      return 5;
    else
      return SupportFunction.roundNumberTo5(
          (numberCorrect / (numberInCorrect + numberUnSelect + numberCorrect)) *
              (lPartScore[0] * 90 + lPartScore[1] * 100 + lPartScore[2] * 305));
  }

  static Future<List> getTimeLearned() async {
    UserData user = await getCurrentUser();
    List testListID = [];
    List<Result> results = [];
    List<int> lTimeLearned = [0, 0, 0, 0, 0, 0, 0];
    List lPart = [
      'part1',
      'part2',
      'part3',
      'part4',
      'part5',
      'part6',
      'part7'
    ];

    QuerySnapshot testSnapshot =
        await userFR.doc(user.uid).collection('results').get();
    testListID = testSnapshot.docs.map((doc) => doc.id).toList();
    for (var id in testListID) {
      for (String part in lPart) {
        testSnapshot = await userFR
            .doc(user.uid)
            .collection('results')
            .doc(id)
            .collection(part)
            .get();
        results +=
            testSnapshot.docs.map((doc) => Result.fromSnap(snap: doc)).toList();
      }
    }
    return results;
  }

  static Future<List<Result>> getOverallPart(String part) async {
    UserData user = await getCurrentUser();
    List testListID = [];
    List<Result> results = [];
    List<Result> latestResults = [];

    QuerySnapshot testSnapshot =
        await userFR.doc(user.uid).collection('results').get();
    testListID = testSnapshot.docs.map((doc) => doc.id).toList();
    for (var id in testListID) {
      testSnapshot = await userFR
          .doc(user.uid)
          .collection('results')
          .doc(id)
          .collection(part)
          .get();
      results =
          testSnapshot.docs.map((doc) => Result.fromSnap(snap: doc)).toList();
      if (results.isNotEmpty) {
        results.sort((a, b) => a.time!.compareTo(b.time!));
        latestResults.add(results.last);
      }
    }
    // print(results);
    return latestResults;
  }

  static Future<List<Result>> getHistoryResult() async {
    UserData user = await getCurrentUser();
    List testListID = [];
    List<Result> results = [];
    List lPart = [
      'part1',
      'part2',
      'part3',
      'part4',
      'part5',
      'part6',
      'part7'
    ];

    QuerySnapshot testSnapshot =
        await userFR.doc(user.uid).collection('results').get();
    testListID = testSnapshot.docs.map((doc) => doc.id).toList();
    for (var id in testListID) {
      for (String part in lPart) {
        testSnapshot = await userFR
            .doc(user.uid)
            .collection('results')
            .doc(id)
            .collection(part)
            .get();
        results += testSnapshot.docs
            .map((doc) => Result.fromSnap(snap: doc, testID: id, part: part))
            .toList();
      }
    }
    // print(results);
    return results;
  }

  static updateTarget(int target) async {
    UserData user = await getCurrentUser();
    return await userFR.doc(user.uid).update({'target': target});
  }

  static Future<int> getTarget() async {
    UserData user = await getCurrentUser();
    DocumentSnapshot targetSnapshot = await userFR.doc(user.uid).get();
    var snapshot = targetSnapshot.data() as Map<String, dynamic>;
    return snapshot['target'] ?? 10;
  }

  static addToFavorite(
      String test, String part, String index, String title) async {
    UserData user = await getCurrentUser();
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
    return await userFR
        .doc(user.uid)
        .collection('favorites')
        .doc(test)
        .collection(part)
        .add({'title': title, 'index': index, 'time': myTimeStamp})
        .then((value) => print("Add Favorite ${value.id} successfully"))
        .catchError((error) => print("Failed to update favorite: $error"));
  }

  static deleteFromFavorite(String test, String part, String index) async {
    UserData user = await getCurrentUser();
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

  static Future<List<VocabularyDocument>> getVocabularyDocumentList() async {
    List<VocabularyDocument> documentList = [];
    QuerySnapshot vocabularyQuerySnapshot = await vocabularyFR.get();
    documentList = vocabularyQuerySnapshot.docs
        .map((doc) => VocabularyDocument.fromSnap(doc))
        .toList();
    return documentList;
  }

  static Future<List<VocabularyTopic>> getVocabularyTopicList(String id) async {
    List<VocabularyTopic> topicList = [];
    QuerySnapshot topicQuerySnapshot =
        await vocabularyFR.doc(id).collection("topics").get();
    topicList = topicQuerySnapshot.docs
        .map((doc) => VocabularyTopic.fromSnap(doc))
        .toList();

    return topicList;
  }

  static Future<List<Vocabulary>> getVocabularyList(
      String docId, String topicID) async {
    List<Vocabulary> vocabularyList = [];
    QuerySnapshot wordQuerySnapshot =
        await vocabularyFR.doc(docId).collection("topics/$topicID/words").get();
    vocabularyList =
        wordQuerySnapshot.docs.map((doc) => Vocabulary.fromSnap(doc)).toList();

    return vocabularyList;
  }

  static addWordToFavorite(String wordId, String word, String meaning,
      String type, String docID, String topicID) async {
    UserData user = await getCurrentUser();
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
    return await userFR
        .doc(user.uid)
        .collection('wordFavorites')
        .add({
          'wordId': wordId,
          'word': word,
          'meaning': meaning,
          'type': type,
          'docID': docID,
          'topicID': topicID,
          'time': myTimeStamp
        })
        .then((value) => print("Add Word Favorite ${value.id} successfull"))
        .catchError((error) => print("Failed to update favorite: $error"));
  }

  static deleteWordFromFavorite(String id) async {
    UserData user = await getCurrentUser();
    CollectionReference favoriteFR =
        userFR.doc(user.uid).collection('wordFavorites');
    List<String> listID = [];
    await favoriteFR
        .where('wordId', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listID.add(doc.id);
      }
    });
    return favoriteFR.doc(listID.first).delete().then((value) {
      print("Delete Word Favorite $id successful");
    }).catchError((error) => print('Failed to Delete news: $error'));
  }

  static Future<Vocabulary> getVocabulary(
      String docID, String topicID, String wordID) async {
    DocumentSnapshot snap =
        await vocabularyFR.doc("$docID/topics/$topicID/words/$wordID").get();
    Vocabulary vocabulary = Vocabulary.fromSnap(snap);
    return vocabulary;
  }

  static getListFavorite() {
    CollectionReference favoriteFR = userFR
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('wordFavorites');

    return favoriteFR.orderBy('time', descending: true).snapshots();
  }
}
