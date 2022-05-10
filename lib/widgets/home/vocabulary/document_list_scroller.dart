// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/widgets/home/vocabulary/document_container.dart';

class DocumentListScroller extends StatelessWidget {
  DocumentListScroller({Key? key}) : super(key: key);

  List<VocabularyDocument> listVocabulary = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VocabularyDocument>>(
        future: FirebaseHandler.getVocabularyDocumentList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something error"));
          }
          listVocabulary = snapshot.data!;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    ...List.generate(
                        listVocabulary.length,
                        (index) =>
                            DocumentContainer(document: listVocabulary[index]))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
