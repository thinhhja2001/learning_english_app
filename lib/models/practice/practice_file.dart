import 'package:learning_english_app/models/practice/practice.dart';

import '../../utils/constants.dart';

class PracticeFile {
  late String? fileTitle;
  late Practice practice;
  late String? id;

  PracticeFile({this.fileTitle, this.id, required this.practice});

  static PracticeFile fromFireStore(String snapID, Practice practice) {
    String title = practicePartShortTitle[practice.practicePart.index] +
        " 0" +
        snapID.substring(4);
    return PracticeFile(practice: practice, id: snapID, fileTitle: title);
  }
}
