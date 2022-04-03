import 'package:flutter/material.dart';
import 'package:learning_english_app/screens/vocabulary/appbar_vocabulary.dart';

import '../../utils/styles.dart';
import '../../widgets/home/vocabulary/word_item.dart';

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
