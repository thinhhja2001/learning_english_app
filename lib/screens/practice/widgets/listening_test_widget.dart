import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/widgets/list_answer_widget.dart';
import 'package:learning_english_app/screens/signin_screen.dart';

import '../../../utils/constants.dart';
import '../../../utils/styles.dart';
import '../../audio_player_widget.dart';

class ListeningTestWidget extends StatefulWidget {
  ListeningTestWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  bool isShowAnswer = false;
  bool isPlaying = false;

  AudioPlayer audioPlayer = AudioPlayer();

  Duration position = Duration.zero;

  Duration duration = Duration.zero;
  @override
  State<ListeningTestWidget> createState() => _ListeningTestWidgetState();
}

class _ListeningTestWidgetState extends State<ListeningTestWidget> {
  @override
  Widget build(BuildContext context) {
    String? swipeDirection;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
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
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      (widget.index + 1).toString(),
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
                        isShowAnswer: widget.isShowAnswer,
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
                  child: AudioPlayerWidget(),
                ),
              ))
        ],
      ),
    );
  }
}
