// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SpeechAudioWidget extends StatefulWidget {
  const SpeechAudioWidget({Key? key, required this.audioUrl}) : super(key: key);

  final String audioUrl;

  @override
  State<SpeechAudioWidget> createState() => _SpeechAudioWidgetState();
}

class _SpeechAudioWidgetState extends State<SpeechAudioWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool audioPlayed = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    // setAudio(widget.audioUrl);

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  Future setAudio(String urlAudio) async {
    audioPlayer.setReleaseMode(ReleaseMode.STOP);
    final player = AudioCache(prefix: "assets/audio/");
    final url = await player.load(urlAudio);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  playRemote(String url) async {
    //AudioPlayer from Url
    int result = await audioPlayer.play(url);
    print('Audio Player Remote');
    if (result == 1) {
      //play success
      setState(() {
        audioPlayed = true;
      });
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.1,
          child: IconButton(
              onPressed: () async {
                if (!isPlaying && !audioPlayed) {
                  await playRemote(widget.audioUrl);
                } else if (audioPlayed && !isPlaying) {
                  int result = await audioPlayer.resume();
                  if (result == 1) {
                    //resume success
                    print("Sound resuming successful.");
                  } else {
                    print("Error on resume audio.");
                  }
                } else {
                  int result = await audioPlayer.pause();
                  if (result == 1) {
                    //resume success
                    print("Sound paused successful.");
                  } else {
                    print("Error on paused audio.");
                  }
                }
              },
              icon: isPlaying
                  ? Icon(
                      Icons.pause,
                      color: Color.fromRGBO(14, 167, 129, 1),
                      size: 30,
                    )
                  : Icon(
                      Icons.volume_up_rounded,
                      color: Color.fromRGBO(14, 167, 129, 1),
                      size: 30,
                    )),
        ),
      ],
    );
  }
}
