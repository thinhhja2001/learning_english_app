import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AudioPlayerWidget extends StatefulWidget {
  AudioPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  String audioUrl =
      "https://firebasestorage.googleapis.com/v0/b/learning-english-app-5f3fe.appspot.com/o/mp3test.mp3?alt=media&token=6cb07c65-1d05-4743-a20d-83de47ed4271&fbclid=IwAR0Yqkqba22teesgnZ19cwUqEdl1KpHU1xSWtZKasyQMWvPGfDcD34X-4NM";
  @override
  void initState() {
    super.initState();
  }

  Future setAudio(String urlAudio) async {
    audioPlayer.setReleaseMode(ReleaseMode.STOP);
    final player = AudioCache(prefix: "assets/audio/");
    final url = await player.load(urlAudio);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.replay_5)),
        IconButton(
            onPressed: () async {
              int result;
              if (isPlaying) {
                result = await audioPlayer.pause();
              } else {
                result = await audioPlayer.play(audioUrl);
              }
              print("result is $result");
            },
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.forward_5)),
        // Slider(
        //     min: 0,
        //     max: widget.duration.inSeconds.toDouble(),
        //     value: widget.position.inSeconds.toDouble(),
        //     onChanged: (value) async {
        //       final position = Duration(seconds: value.toInt());
        //       await widget.audioPlayer.seek(position);

        //       await widget.audioPlayer.resume();
        //     }),
      ],
    );
  }
}
