import 'package:learning_english_app/utils/constants.dart';

class Practice {
  late String _iconData;
  PracticePart _practicePart = PracticePart.part1;
  PracticeType _practiceType = PracticeType.listening;

  String get iconData => _iconData;
  PracticePart get practicePart => _practicePart;
  PracticeType get practiceType => _practiceType;

  Practice(
      {required String iconData,
      required PracticePart practicePart,
      required PracticeType practiceType}) {
    _iconData = iconData;
    _practicePart = practicePart;
    _practiceType = practiceType;
  }
}
