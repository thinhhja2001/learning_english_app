// ignore_for_file: prefer_const_constructors

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_document.dart';
import 'package:learning_english_app/providers/vocabulary/vocaublary_provider.dart';
import 'package:learning_english_app/widgets/home/vocabulary/document_point.dart';
import 'package:provider/provider.dart';

import '../../../screens/vocabulary/topic_list_screen.dart';
import '../../../utils/styles.dart';

// ignore: must_be_immutable
class DocumentContainer extends StatelessWidget {
  DocumentContainer({
    Key? key,
    required this.document,
  }) : super(key: key);

  VocabularyDocument document;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double categoryHeight = screenSize.height * 0.25 - 60;
    final double containerWidth = screenSize.width * 0.4;
    final double pointWidth = containerWidth * 0.67;
    final VocabularyProvider _vocabularyProvider =
        Provider.of<VocabularyProvider>(context);
    return Container(
      width: containerWidth,
      margin: const EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: InkWell(
        onTap: () {
          _vocabularyProvider.updateDocument(document);
          Get.to(const TopicListScreen());
        },
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54])
                    .createShader(
                        Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(document.image!), fit: BoxFit.fill),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  document.title!,
                  style: ktsWhiteTitle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: pointWidth,
                    child: DocumentPoint(totalWord: document.totalWord!),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
