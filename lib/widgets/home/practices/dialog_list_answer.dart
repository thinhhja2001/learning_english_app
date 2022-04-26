// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/widgets/home/practices/review_widget.dart';

import '../../../models/review_chart_data.dart';
import '../../../utils/styles.dart';
import 'custom_radio.dart';

class DialogListAnswer extends StatefulWidget {
  const DialogListAnswer({Key? key}) : super(key: key);

  @override
  State<DialogListAnswer> createState() => _DialogListAnswerState();
}

class _DialogListAnswerState extends State<DialogListAnswer> {
  @override
  Widget build(BuildContext context) {
    var random = Random();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child:
                    Center(child: Text('Question Sheet', style: ktsBoldText)),
              ),
            ),
            Expanded(
              flex: 12,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: random.nextInt(20),
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          CustomRadio(
                            correctAnswerIndex: random.nextInt(4),
                            numberQuestion: index + 1,
                            isShowingAnswer: random.nextBool(),
                            answerIndex: random.nextInt(4),
                            numberAsnwer: 4,
                            onPress: () {},
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            height: 2,
                            decoration: BoxDecoration(color: Colors.grey[400]),
                          ),
                        ],
                      );
                    })),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.green)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          fixedSize:
                              MaterialStateProperty.all<Size>(Size(180, 40)),
                        ),
                        child: Text(
                          "Back",
                          style:
                              ktsDialogActionText.copyWith(color: Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final List<ReviewChartData> chartData = [
                            ReviewChartData(
                                x: 'Correct answer', y: 4, color: Colors.green),
                            ReviewChartData(
                                x: 'Wrong answer', y: 5, color: Colors.red),
                            ReviewChartData(
                                x: 'Unselected answer',
                                y: 2,
                                color: Colors.grey),
                          ];
                          Get.to(ReviewWidget(chartData: chartData));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          fixedSize:
                              MaterialStateProperty.all<Size>(Size(180, 40)),
                        ),
                        child: Text(
                          "Submit",
                          style:
                              ktsDialogActionText.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}