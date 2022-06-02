// ignore_for_file: avoid_print, must_be_immutable

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AudioPlayerWidget extends StatefulWidget {
  AudioPlayerWidget({Key? key, required this.audioUrl, required this.isRemote})
      : super(key: key);

  String audioUrl;
  bool isRemote;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool audioPlayed = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

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

  void seekToSec(int sec) {
    if (sec < 0) {
      sec = 0;
    }
    if (sec > duration.inSeconds) {
      sec = duration.inSeconds;
    }
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
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

  playLocal(String urlFile) async {
    //AudioPlayer from assets/audios/
    ByteData bytes = await rootBundle
        .load('assets/audios/' + urlFile); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    print('Audio Player Local');

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
                onPressed: () => seekToSec(position.inSeconds - 5),
                icon: const Icon(Icons.replay_5))),
        SizedBox(
          width: screenWidth * 0.1,
          child: IconButton(
              onPressed: () async {
                if (!isPlaying && !audioPlayed) {
                  if (widget.isRemote) {
                    await playRemote(widget.audioUrl);
                  } else {
                    await playLocal(widget.audioUrl);
                  }
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
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
        ),
        SizedBox(
            width: screenWidth * 0.1,
            child: IconButton(
                onPressed: () => seekToSec(position.inSeconds + 5),
                icon: const Icon(Icons.forward_5))),
        SizedBox(
          width: screenWidth * 0.5,
          child: SliderTheme(
            data: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
            child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                }),
          ),
        ),
        SizedBox(width: screenWidth * 0.1, child: Text(formatTime(position))),
      ],
    );
  }
}
