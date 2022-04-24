import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_scraper/web_scraper.dart';

import '../models/question.dart';

class DataScraper {
  List<String> _getAudiosUrl(List<Map<String, dynamic>> audios) {
    List<String> audiosUrl = List.empty(growable: true);
    for (var i = 0; i < audios.length; i++) {
      audiosUrl.add(audios[i]['title']);
    }
    return audiosUrl;
  }

  List<dynamic> _getEnglishAnswers(
      List<Map<String, dynamic>> allAnswersInBothLanguage) {
    List<dynamic> allAnswerInEnglish = List.empty(growable: true);
    for (var i = 0; i < allAnswersInBothLanguage.length; i++) {
      if (i % 2 == 0) {
        allAnswerInEnglish.add(allAnswersInBothLanguage[i]['title']);
      }
    }
    return allAnswerInEnglish;
  }

  List<String> _getImagesUrl(List<Map<String, dynamic>> images) {
    List<String> imagesUrl = List.empty(growable: true);
    for (var i = 0; i < images.length; i++) {
      imagesUrl.add(images[i]['attributes']['src']);
    }
    return imagesUrl;
  }

  void webScraper(List<String> audiosUrl, List<String> imagesUrl,
      List<Question> questions) async {
    final webScraper = WebScraper('https://www.antoeic.vn/');
    if (await webScraper.loadWebPage("/part-1-practice-test-01-2")) {
      List<Map<String, dynamic>> audios =
          webScraper.getElement('audio', ['src']);
      List<Map<String, dynamic>> images1 = webScraper
          .getElement('div.wpProQuiz_question_text > p > img', ['src']);
      List<Map<String, dynamic>> images2 = webScraper
          .getElement('div.wpProQuiz_question_text > p > a > img', ['src']);
      List<Map<String, dynamic>> images = List.empty(growable: true);
      images.addAll(images1);
      images.addAll(images2);
      audiosUrl = _getAudiosUrl(audios);
      imagesUrl = _getImagesUrl(images);
      List<Map<String, dynamic>> allAnswersInBothLanguage =
          webScraper.getElement("div.wpProQuiz_correct > p", ['']);
      List<dynamic> allAnswerInEnglish =
          _getEnglishAnswers(allAnswersInBothLanguage);
      // print(allAnswerInEnglish[0].toString());
      questions = List.empty(growable: true);
      for (var i = 0; i < allAnswerInEnglish.length; i++) {
        Question question = Question(
            allAnswer: allAnswerInEnglish[i],
            correctAnswer: 'A',
            audioUrl: audiosUrl[i],
            imageUrl: imagesUrl[i]);
        questions.add(question);
      }
      for (var i = 0; i < questions.length; i++) {
        FirebaseFirestore.instance
            .collection('tests')
            .doc('test1')
            .collection('part1')
            .doc("${i + 1}")
            .collection("questions")
            .doc("${i + 1}")
            .set(questions[i].toJson());
      }
    }
  }
}
