// ignore_for_file: prefer_const_constructors

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class QuestionListWidget extends StatefulWidget {
  const QuestionListWidget({Key? key}) : super(key: key);

  @override
  State<QuestionListWidget> createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(child: Text('Question sheet'))),
        ListView.builder(
            itemCount: 6,
            itemBuilder: ((context, index) {
              return Row(children: [
                Text('$index'),
                CustomCheckBoxGroup(
                  // scrollController: ScrollController(),
                  unSelectedColor: Theme.of(context).canvasColor,
                  // ignore: prefer_const_literals_to_create_immutables
                  buttonLables: [
                    "A",
                    "B",
                    "C",
                    "D",
                  ],
                  buttonValuesList: [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                  ],
                  checkBoxButtonValues: (values) {
                    print(values);
                  },
                  defaultSelected: ["Monday"],
                  horizontal: true,
                  width: 120,
                  // hight: 50,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  padding: 5,
                  spacing: 0.0,
                  // enableShape: true,
                ),
              ]);
            }))
      ],
    );
  }
}
