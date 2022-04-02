import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_app/screens/vocabulary/vocabulary_list_screen.dart';

import '../../utils/styles.dart';

class VocabularyDetailedListScreen extends StatefulWidget {
  const VocabularyDetailedListScreen({Key? key}) : super(key: key);

  @override
  _VocabularyDetailedListState createState() => _VocabularyDetailedListState();
}

class _VocabularyDetailedListState extends State<VocabularyDetailedListScreen> {
  double _progressValue = 0.2;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarVocabularyList(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                  WordItem(
                      progressValue: _progressValue, screenSize: screenSize),
                ]),
          )),
        ),
        floatingActionButton: Wrap(
            direction: Axis.horizontal, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 8),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    label: Row(
                      children: [
                        Icon(Icons.fiber_new_rounded, color: Colors.white),
                        SizedBox(width: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            "Learn new words",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: ktsWhiteTitle,
                          ),
                        ),
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 8),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green.shade300,
                    onPressed: () {},
                    label: Row(
                      children: [
                        Icon(Icons.flip, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Flashcard",
                          style: ktsWhiteTitle,
                        ),
                      ],
                    ),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  )),
            ]));
  }
}

class WordItem extends StatelessWidget {
  const WordItem({
    Key? key,
    required double progressValue,
    required this.screenSize,
  })  : _progressValue = progressValue,
        super(key: key);

  final double _progressValue;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: 0.2,
                      strokeWidth: 5,
                      backgroundColor: Colors.green.shade100,
                      color: Colors.green.shade400,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  Center(
                    child: Text('${(_progressValue * 100).round()}%',
                        style: ktsCircleProgress),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("abide by", style: ktsTitle),
                Row(
                  children: [
                    Text(
                      "(verb)",
                      style: ktsDescriptionItalic,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(" "),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Text(
                          "tôn trọng, tuân thủ aaaaaaaaaaaaaaaaaaaaaaaaa",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: ktsDescription),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
