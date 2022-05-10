// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/vocabulary_topic.dart';
import 'package:learning_english_app/providers/vocabulary/vocaublary_provider.dart';
import 'package:learning_english_app/screens/vocabulary/word_list_screen.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:provider/provider.dart';

class TopicItem extends StatefulWidget {
  const TopicItem({Key? key, required this.topic}) : super(key: key);
  final VocabularyTopic topic;

  @override
  State<TopicItem> createState() => _TopicItemState();
}

class _TopicItemState extends State<TopicItem> {
  @override
  Widget build(BuildContext context) {
    final VocabularyProvider _vocabularyProvider =
        Provider.of<VocabularyProvider>(context);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            _vocabularyProvider.updateTopic(widget.topic);
            Get.to(WordListScreen());
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87
                        ]).createShader(
                        Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
                  },
                  blendMode: BlendMode.darken,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.topic.image!),
                            fit: BoxFit.fill),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.topic.title!,
                      style: kts26Title,
                    ),
                    Text(
                      widget.topic.meaning!,
                      style: kts20Title,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
