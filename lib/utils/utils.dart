import 'package:flutter/material.dart';

Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

Color getShowColor(
    {required String answer,
    required String correctAnswer,
    required bool isShowAnswer,
    required String? choseAnswer}) {
  if (isShowAnswer == false) {
    return Colors.black;
  } else {
    if (answer == correctAnswer) {
      return Colors.green;
    } else if (answer == choseAnswer && answer != correctAnswer) {
      return Colors.red;
    }
    return Colors.black;
  }
}

Color getShowColor1(
    {required int answerIndex,
    required int correctAnswerIndex,
    required bool isShowAnswer,
    required int? choseAnswer}) {
  if (isShowAnswer) {
    if (answerIndex == correctAnswerIndex) return Colors.green;
    if (answerIndex == choseAnswer && answerIndex != correctAnswerIndex)
      return Colors.red;

    return Colors.black;
  }
  return Colors.black;
}

FontWeight getFontWeight(
    {required String answer,
    required String correctAnswer,
    required bool isShowAnswer,
    required String? choseAnswer}) {
  if (isShowAnswer == false) {
    return FontWeight.w400;
  } else {
    if (answer == choseAnswer || answer == correctAnswer) {
      return FontWeight.bold;
    }
    return FontWeight.w400;
  }
}

FontWeight getFontWeight1(
    {required int answerIndex,
    required int correctAnswerIndex,
    required bool isShowAnswer,
    required int? choseAnswer}) {
  if (isShowAnswer) {
    if (answerIndex == choseAnswer || answerIndex == correctAnswerIndex) {
      return FontWeight.bold;
    }

    return FontWeight.w400;
  }
  return FontWeight.w400;
}
