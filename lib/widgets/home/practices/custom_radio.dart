// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class CustomRadio extends StatefulWidget {
  CustomRadio(
      {Key? key,
      required this.isSelect,
      required this.isShowingAnswer,
      required this.correctAnswerIndex,
      required this.answerIndex,
      required this.numberAsnwer,
      required this.onPress,
      required this.numberQuestion})
      : super(key: key);
  bool isShowingAnswer;
  bool isSelect;
  int correctAnswerIndex;
  int answerIndex;
  int numberAsnwer;
  int numberQuestion;
  VoidCallback onPress;
  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberAsnwer; i++) {
      if (widget.isSelect) {
        if (widget.correctAnswerIndex == i) {
          if (widget.isShowingAnswer) {
            sampleData.add(RadioModel(true, true, String.fromCharCode(i + 65)));
          } else {
            sampleData.add(RadioModel(
                widget.answerIndex == i, true, String.fromCharCode(i + 65)));
          }
        } else {
          sampleData.add(RadioModel(
              widget.answerIndex == i, false, String.fromCharCode(i + 65)));
        }
      } else {
        sampleData.add(RadioModel(false, false, String.fromCharCode(i + 65)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                  child: Text('${widget.numberQuestion}', style: ktsBoldText)),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sampleData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioItem(
                          sampleData[index], widget.isShowingAnswer);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  final bool isShowingAnswer;
  RadioItem(this._item, this.isShowingAnswer);

  Color getCorrectColor(bool isShowingAnswer, bool isSelect, bool isCorrect) {
    return isSelect
        ? isShowingAnswer
            ? isCorrect
                ? Colors.green
                : Colors.red
            : Colors.grey
        : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 70,
        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 40.0,
              child: Center(
                child: Text(_item.buttonText,
                    style: TextStyle(
                        color: _item.isSelected ? Colors.white : Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
              decoration: BoxDecoration(
                color: getCorrectColor(
                    isShowingAnswer, _item.isSelected, _item.isCorrect),
                border: Border.all(
                    width: 1.0,
                    color: _item.isSelected ? Colors.blueAccent : Colors.grey),
                shape: BoxShape.circle,
              ),
            ),
            _item.isSelected
                ? isShowingAnswer
                    ? _item.isCorrect
                        ? SizedBox()
                        : Icon(Icons.close, color: Colors.red)
                    : SizedBox()
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  bool isCorrect;
  final String buttonText;

  RadioModel(this.isSelected, this.isCorrect, this.buttonText);
}
