import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  AudioPlayerWidget({
    Key? key,
    required this.isPlaying,
    required this.audioPlayer,
    required this.position,
    required this.duration,
  }) : super(key: key);

  bool isPlaying;
  final AudioPlayer audioPlayer;
  Duration position;
  Duration duration;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  @override
  void initState() {
    super.initState();
    setAudio();
    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        widget.isPlaying = state == PlayerState.PLAYING;
      });
    });
    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        widget.duration = newDuration;
      });
    });
    widget.audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        widget.position = newPosition;
      });
    });
  }

  Future setAudio() async {
    widget.audioPlayer.setReleaseMode(ReleaseMode.STOP);
    final player = AudioCache(prefix: "assets/");
    final url = await player.load('mp3test.mp3');
    widget.audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.replay_5)),
        IconButton(
            onPressed: () async {
              if (widget.isPlaying) {
                await widget.audioPlayer.pause();
              } else {
                await widget.audioPlayer.play(
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
              }
            },
            icon: Icon(widget.isPlaying ? Icons.pause : Icons.play_arrow)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.forward_5)),
        Slider(
            min: 0,
            max: widget.duration.inSeconds.toDouble(),
            value: widget.position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await widget.audioPlayer.seek(position);

              await widget.audioPlayer.resume();
            }),
      ],
    );
  }
}
