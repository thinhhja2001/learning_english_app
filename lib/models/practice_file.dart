import 'package:learning_english_app/models/practice.dart';

class PracticeFile {
  late String _fileTitle;
  String _fileUrl = "";
  late String _fileTakeFrom;
  late int _fileQuestionCount;
  late double _fileSize;
  late Practice _practice;
  late String _id;

  String get id => _id;
  String get fileTitle => _fileTitle;
  String get fileUrl => _fileUrl;
  String get fileTakeFrom => _fileTakeFrom;
  int get fileQuestionCount => _fileQuestionCount;
  double get fileSize => _fileSize;
  Practice get practice => _practice;

  PracticeFile(
      {required String fileTitle,
      required String fileTakeFrom,
      required int fileQuestionCount,
      required double fileSize,
      required Practice practice}) {
    _fileTitle = fileTitle;
    _fileTakeFrom = fileTakeFrom;
    _fileQuestionCount = fileQuestionCount;
    _fileSize = fileSize;
    _practice = practice;
  }
}
