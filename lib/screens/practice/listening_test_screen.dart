import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/list_answer_widget.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/utils.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../audio_player_widget.dart';

class ListeningTestScreen extends StatefulWidget {
  const ListeningTestScreen({Key? key, required this.titleColor})
      : super(key: key);
  final titleColor;

  @override
  State<ListeningTestScreen> createState() => _ListeningTestScreenState();
}

class _ListeningTestScreenState extends State<ListeningTestScreen> {
  String? _value = "-1";
  bool isShowAnswer = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Part 1",
              style: kDefaultTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              "Photograph",
              style: kDefaultTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: widget.titleColor),
            )
          ],
        ),
        backgroundColor: kcWhiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/part_1.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: kDefaultBorderRadius,
                                      topRight: kDefaultBorderRadius)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        "2",
                                        style: kDefaultTextStyle.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        ListAnswerWidget(
                          isShowAnswer: isShowAnswer,
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: kDefaultBorderRadius,
                            topRight: kDefaultBorderRadius)),
                    child: AudioPlayerWidget(
                        isPlaying: isPlaying,
                        audioPlayer: audioPlayer,
                        position: position,
                        duration: duration),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
