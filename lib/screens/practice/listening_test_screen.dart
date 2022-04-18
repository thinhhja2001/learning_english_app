import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/widgets/list_answer_widget.dart';
import 'package:learning_english_app/screens/practice/widgets/listening_test_widget.dart';
import 'package:learning_english_app/screens/practice/widgets/review_widget.dart';
import 'package:learning_english_app/screens/signin_screen.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../audio_player_widget.dart';

class ReviewChartData {
  ReviewChartData({required this.x, required this.y, required this.color});
  final String x;
  final int y;
  final Color color;
}

class ListeningTestScreen extends StatefulWidget {
  const ListeningTestScreen({Key? key, required this.titleColor})
      : super(key: key);
  final titleColor;

  @override
  State<ListeningTestScreen> createState() => _ListeningTestScreenState();
}

class _ListeningTestScreenState extends State<ListeningTestScreen> {
  final swiperController = SwiperController();
  String? _value = "-1";
  bool isShowAnswer = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final _tooltipBehavior = TooltipBehavior(enable: true);
  bool isPlaying = false;
  final List<ReviewChartData> chartData = [
    ReviewChartData(x: 'Correct answer', y: 4, color: Colors.green),
    ReviewChartData(x: 'Wrong answer', y: 5, color: Colors.red),
    ReviewChartData(x: 'Unselected answer', y: 2, color: Colors.grey),
  ];
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
      body: Swiper(
          controller: swiperController,
          itemCount: 10,
          loop: false,
          itemBuilder: (context, index) => index < 9
              ? ListeningTestWidget(index: index)
              : ReviewWidget(
                  tooltipBehavior: _tooltipBehavior,
                  chartData: chartData,
                  swiperController: swiperController)),
    );
  }
}
