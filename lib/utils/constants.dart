import 'package:flutter/material.dart';

import '../models/practice/practice.dart';

enum CustomInputFieldType { text, password }

enum PracticeType { listening, reading, test }

enum PracticePart {
  part1,
  part2,
  part3,
  part4,
  part5,
  part6,
  part7,
  reading,
  listening,
  test
}

const double kDefaultPadding = 8.0;
const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

// horizontal spacing

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLightLarge = SizedBox(height: 40.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

List<String> practicePartName = [
  "Part 1",
  "Part 2",
  "Part 3",
  "Part 4",
  "Part 5",
  "Part 6",
  "Part 7",
  "Listening",
  "Reading",
  "Full Text"
];

List<String> practicePartNameFB = [
  "part1",
  "part2",
  "part3",
  "part4",
  "part5",
  "part6",
  "part7",
];

List<String> practicePartTitle = [
  "Photograph",
  "Question and response",
  "Conversation",
  "Short talks",
  "Incomplete sentences",
  "Text completion",
  "Reading comprehension",
  "Full part of listening",
  "Full part of reading",
  "Full part of test"
];

List<String> practicePartShortTitle = [
  "Photograph",
  "Question & Response",
  "Conversation",
  "Short Talks",
  "Incomplete Sentences",
  "Text Completion",
  "Reading Comprehension",
  "Listening",
  "Reading",
  "Test"
];

List<String> questionListForTest = [
  "1 - 6",
  "7 - 31",
  "32 - 70",
  "71 - 100",
  "101 - 130",
  "131 - 146",
  "147 - 200",
  "1 - 100",
  "101 - 200",
  "1 - 200"
];

List<int> practiceTotalQuestion = [6, 25, 39, 30, 30, 15, 54, 100, 100, 200];

List<Practice> listenings = [
  Practice(
      iconData: "e043",
      practicePart: PracticePart.part1,
      practiceType: PracticeType.listening),
  Practice(
      iconData: "e154",
      practicePart: PracticePart.part2,
      practiceType: PracticeType.listening),
  Practice(
      iconData: "e231",
      practicePart: PracticePart.part3,
      practiceType: PracticeType.listening),
  Practice(
      iconData: "e4a9",
      practicePart: PracticePart.part4,
      practiceType: PracticeType.listening),
];

List<Practice> readings = [
  Practice(
      iconData: "e5e1",
      practicePart: PracticePart.part5,
      practiceType: PracticeType.reading),
  Practice(
      iconData: "e1f7",
      practicePart: PracticePart.part6,
      practiceType: PracticeType.reading),
  Practice(
      iconData: "f0639",
      practicePart: PracticePart.part7,
      practiceType: PracticeType.reading)
];

List<Practice> tests = [
  Practice(
      iconData: "e510",
      practicePart: PracticePart.listening,
      practiceType: PracticeType.test),
  Practice(
      iconData: "e0ef",
      practicePart: PracticePart.reading,
      practiceType: PracticeType.test),
  Practice(
      iconData: "ef49",
      practicePart: PracticePart.test,
      practiceType: PracticeType.test),
];

const kDefaultBorderRadius = Radius.circular(20);
List<String> answers = [
  "talavua",
  "vipnhatthegioi",
  "danchoixuhue",
  "vietnam2k1"
];

List<String> answers_part2 = [
  'Sure, I’d be happy to.',
  'Actually, we shipped them already.',
  'The manager is new, though.'
];

String correctAnswer = "vietnam2k1";
String correctAnswerPart2 = "The manager is new, though.";

var myMapName = {
  0: 'A',
  1: 'B',
  2: 'C',
  3: 'D',
};
