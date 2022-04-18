// ignore_for_file: prefer_const_constructors

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/utils.dart';
import 'package:learning_english_app/widgets/home/practices/review_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/review_chart_data.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../../widgets/home/practices/audio_player_widget.dart';
import '../../widgets/home/practices/list_answer_widget.dart';

class PageQuizScreen extends StatelessWidget {
  PageQuizScreen({Key? key}) : super(key: key);

  bool isListeningTest(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return true;
    } else {
      return false;
    }
  }

  final List<ReviewChartData> chartData = [
    ReviewChartData(x: 'Correct answer', y: 4, color: Colors.green),
    ReviewChartData(x: 'Wrong answer', y: 5, color: Colors.red),
    ReviewChartData(x: 'Unselected answer', y: 2, color: Colors.grey),
  ];

  void showDialog(
      TooltipBehavior tooltipBehavior, SwiperController swiperController) {
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
          onPressed: () => Get.to(ReviewWidget(
              tooltipBehavior: tooltipBehavior,
              chartData: chartData,
              swiperController: swiperController)),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = new TooltipBehavior();
    SwiperController swiperController = new SwiperController();
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBarQuizPractice(pageQuizProvider: _pageQuizProvider),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index == 4) {
            Future.delayed(Duration.zero,
                () => showDialog(tooltipBehavior, swiperController));
            return Padding(
                padding: const EdgeInsets.all(8.0), child: QuestionWidget());
          } else {
            return Padding(
                padding: const EdgeInsets.all(8.0), child: QuestionWidget());
            // return ReviewWidget(
            //     tooltipBehavior: tooltipBehavior,
            //     chartData: chartData,
            //     swiperController: swiperController);
          }
        },
        indicatorLayout: PageIndicatorLayout.SCALE,
        autoplay: false,
        autoplayDelay: 1000,
        itemCount: 5,
        loop: false,
        fade: 1.0,
        viewportFraction: 1,
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Scrollbar(
            child: Accordion(
              maxOpenSections: 3,
              headerBackgroundColorOpened: Colors.white,
              openAndCloseAnimation: false,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              children: [
                AccordionSection(
                  isOpen: true,
                  headerBackgroundColor: Colors.blue,
                  headerBackgroundColorOpened: Colors.blue,
                  header: Text('2. We’ve met these clients before, haven’t we?',
                      style: kDefaultTextStyle.copyWith(color: Colors.white)),
                  content: ListAnswerWidget(isShowAnswer: false),
                  contentHorizontalPadding: 10,
                  contentBorderWidth: 0,
                ),
                AccordionSection(
                  isOpen: true,
                  headerBackgroundColor: Colors.blue,
                  headerBackgroundColorOpened: Colors.blue,
                  header: Text('2. We’ve met these clients before, haven’t we?',
                      style: kDefaultTextStyle.copyWith(color: Colors.white)),
                  content: ListAnswerWidget(isShowAnswer: false),
                  contentHorizontalPadding: 10,
                  contentBorderWidth: 0,
                ),
                AccordionSection(
                  isOpen: true,
                  headerBackgroundColor: Colors.blue,
                  headerBackgroundColorOpened: Colors.blue,
                  header: Text('2. We’ve met these clients before, haven’t we?',
                      style: kDefaultTextStyle.copyWith(color: Colors.white)),
                  content: ListAnswerWidget(isShowAnswer: false),
                  contentHorizontalPadding: 10,
                  contentBorderWidth: 0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: kDefaultBorderRadius,
                        topRight: kDefaultBorderRadius)),
                child: Column(
                  children: [
                    // isListeningTest(_pageQuizProvider.practiceFile.practice.practiceType)
                    true
                        ? AudioPlayerWidget(
                            audioUrl: 'mp3test.mp3', isRemote: false)
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_back)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wb_incandescent_outlined)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.error_outline)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class AppBarQuizPractice extends StatelessWidget with PreferredSizeWidget {
  const AppBarQuizPractice({
    Key? key,
    required PageQuizProvider pageQuizProvider,
  })  : _pageQuizProvider = pageQuizProvider,
        super(key: key);

  final PageQuizProvider _pageQuizProvider;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            _pageQuizProvider.practiceFile.fileTitle,
            style: kDefaultTextStyle.copyWith(fontSize: 20),
          ),
          Text(
            "Question / ${questionListForTest[_pageQuizProvider.practiceFile.practice.practicePart.index]}",
            style: kDefaultTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: getPrimaryColor(
                    _pageQuizProvider.practiceFile.practice.practiceType)),
          )
        ],
      ),
      backgroundColor: kcWhiteColor,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.checklist,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        )
      ],
    );
  }
}
