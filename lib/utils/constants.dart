import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice.dart';

enum CustomInputFieldType { text, password }
enum PracticeType { listening, reading, test }
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
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

List<Practice> listenings = [
  Practice(name: "Photographs", iconData: "e043"),
  Practice(name: "Question and Response", iconData: "e154"),
  Practice(name: "Conversations", iconData: "e231"),
  Practice(name: "Short talks", iconData: "e429"),
];

List<Practice> readings = [
  Practice(name: "Incomplete sentences", iconData: "e5e1"),
  Practice(name: "Text completion", iconData: "e1f7"),
  Practice(name: "Reading", iconData: "f0639"),
];

List<Practice> tests = [
  Practice(name: "Full part of listening", iconData: "e510"),
  Practice(name: "Full part of reading", iconData: "e0ef"),
  Practice(name: "Full part of test", iconData: "e1f7"),
];

const kDefaultBorderRadius = Radius.circular(20);
List<String> answers = [
  "talavua",
  "vipnhatthegioi",
  "danchoixuhue",
  "vietnam2k1"
];

String correctAnswer = "vietnam2k1";
