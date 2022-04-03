// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:learning_english_app/screens/vocabulary/appbar_vocabulary.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_item.dart';

import '../../utils/styles.dart';

class VocabularyListScreen extends StatefulWidget {
  const VocabularyListScreen({Key? key}) : super(key: key);

  @override
  _VocabularyListState createState() => _VocabularyListState();
}

class _VocabularyListState extends State<VocabularyListScreen> {
  @override
  Widget build(BuildContext context) {
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
              children: <Widget>[
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
                VocabularyItem(),
              ],
            ),
          )),
        ),
        floatingActionButton: Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Row(
                children: [
                  Icon(Icons.fiber_new_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "Learn new words",
                    style: ktsWhiteTitle,
                  ),
                ],
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            )));
  }
}
