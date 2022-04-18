import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/widgets/listening_test_widget.dart';
import 'package:learning_english_app/screens/practice/widgets/review_widget.dart';
import 'package:learning_english_app/widgets/home/practices/list_answer_widget.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../providers/pratice/page_quiz_provider.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../widgets/home/practices/audio_player_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
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
        body: PageView.builder(
          controller: _pageQuizProvider.pageController,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => index < 4
              ? ListeningWithPictureWidget()
              : ReviewWidget(
                  chartData: chartData,
                ),
        ));
  }
}

class ListeningWithPictureWidget extends StatelessWidget {
  const ListeningWithPictureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageQuizProvider pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    void nextPage() {
      int? currentPage = pageQuizProvider.pageController.page?.toInt();
      if (currentPage == 3) {
        Get.dialog(AlertDialog(
          title: const Text('Do you want to submit?'),
          content: const Text('You are on the last question.'),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () => Get.back(),
            ),
            TextButton(
                child: const Text("Yes", style: TextStyle(color: Colors.green)),
                onPressed: () {
                  Navigator.pop(context);
                  Get.to(ReviewWidget(
                    chartData: chartData,
                  ));
                }),
          ],
        ));
      } else {
        pageQuizProvider.pageController.animateToPage(
            pageQuizProvider.pageController.page!.toInt() + 1,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn);
      }
    }

    void previousPage() {
      pageQuizProvider.pageController.animateToPage(
          pageQuizProvider.pageController.page!.toInt() - 1,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn);
    }

    return Column(
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
                      isShowAnswer: false,
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
                child: Column(
                  children: [
                    AudioPlayerWidget(audioUrl: 'mp3test.mp3', isRemote: false),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: previousPage,
                            icon: Icon(Icons.arrow_back)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wb_incandescent_outlined)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.error_outline)),
                        IconButton(
                            onPressed: nextPage,
                            icon: Icon(Icons.arrow_forward)),
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
