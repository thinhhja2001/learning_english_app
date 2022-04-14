import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice.dart';

enum CustomInputFieldType { text, password }
enum PracticeType { listening, reading, test }
const double kDefaultPadding = 8.0;
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
  Practice(name: "Photograph", iconData: "e043"),
  Practice(name: "Questions and Response", iconData: "e154"),
  Practice(name: "Conversation", iconData: "e231"),
];

List<Practice> readings = [
  Practice(name: "Incomplete sentences", iconData: "e5e1"),
  Practice(name: "Text completion", iconData: "e1f7"),
  Practice(name: "Reading", iconData: "f0639"),
  Practice(name: "Plan", iconData: "e429"),
];

List<Practice> tests = [
  Practice(name: "Full part of listening", iconData: "e510"),
  Practice(name: "Full part of reading", iconData: "e0ef"),
];

const kDefaultBorderRadius = Radius.circular(20);
List<String> answers = [
  "talavua",
  "vipnhatthegioi",
  "danchoixuhue",
  "vietnam2k1"
];

String correctAnswer = "vietnam2k1";
