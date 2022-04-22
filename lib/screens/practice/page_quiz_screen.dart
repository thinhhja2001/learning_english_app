// ignore_for_file: prefer_const_constructors

// import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/utils.dart';
import 'package:learning_english_app/widgets/accordion.dart';
import 'package:learning_english_app/widgets/body_part6.dart';
import 'package:learning_english_app/widgets/home/practices/review_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/review_chart_data.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../../widgets/home/practices/audio_player_widget.dart';
import '../../widgets/home/practices/list_answer_widget.dart';

class PageQuizScreen extends StatefulWidget {
  PageQuizScreen({Key? key}) : super(key: key);

  @override
  State<PageQuizScreen> createState() => _PageQuizScreenState();
}

class _PageQuizScreenState extends State<PageQuizScreen> {
  int maxIndex = 0;

  var allData = <String>[];

  bool isListeningTest(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    countDocuments('test1', 'part6');
    super.initState();
  }

  void countDocuments(String testId, String part) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("tests")
        .doc(testId)
        .collection(part)
        .get(); // Count of Documents in Collection

    // Get data from docs and convert map to List
    // print(count);

    // if (count == 0) {
    //   count++;
    //   setState(() {

    //     count++;
    //   });
    // }
    this.allData = querySnapshot.docs.map((doc) => doc.id).toList();

    print(this.allData);
    maxIndex = this.allData.length;
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

  int i = 0;

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = new TooltipBehavior();
    SwiperController swiperController = new SwiperController();
    final PageQuizProvider _pageQuizProvider =
        Provider.of<PageQuizProvider>(context);
    final String _part = _pageQuizProvider.practiceFile.practice.practicePart
        .toString()
        .split('.')[1];
    final String _testId = "test1";
    CollectionReference part = FirebaseFirestore.instance
        .collection("tests")
        .doc(_testId)
        .collection(_part);
    return Scaffold(
        backgroundColor: kcGreyColor,
        appBar: AppBarQuizPractice(pageQuizProvider: _pageQuizProvider),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("tests")
              .doc(_testId)
              .collection(_part)
              .get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Accordion(
                header: Text("Error",
                    style: TextStyle(color: Colors.white, fontSize: 17)),
                content: Text("Something went wrong"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              try {
                var allData = snapshot.data.docs.map((doc) => doc.id).toList();

                print(this.allData);
                maxIndex = this.allData.length;
                return Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    if (index == maxIndex) {
                      Future.delayed(Duration.zero,
                          () => showDialog(tooltipBehavior, swiperController));
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: QuestionWidget(
                            pageQuizProvider: _pageQuizProvider,
                            documentId: allData[index],
                          ));
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
                );
              } catch (e) {
                print(e);
              }
              return Accordion(
                header: Text("Error",
                    style: TextStyle(color: Colors.white, fontSize: 17)),
                content: Text("Something went wrong"),
              );
            }

            return Accordion(
              header: Text("",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              content: Text("Loading"),
            );
          },
        ));
  }
}

class QuestionWidget extends StatelessWidget {
  QuestionWidget({
    Key? key,
    required PageQuizProvider pageQuizProvider,
    required String documentId,
  }) : super(key: key) {
    // TODO: implement
    _pageQuizProvider = pageQuizProvider;
    _documentId = documentId;
  }

  late final PageQuizProvider _pageQuizProvider;
  late final String _documentId;

  @override
  Widget build(BuildContext context) {
    final String _part = _pageQuizProvider.practiceFile.practice.practicePart
        .toString()
        .split('.')[1];

    final String testId = "test1";

    var questionIDs = _documentId.contains('-')
        ? [
            for (var i = int.parse(_documentId.split('-')[0]);
                i <= int.parse(_documentId.split('-')[1]);
                i++)
              i
          ]
        : [int.parse(_documentId)];

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
              child: Column(children: [
            ExpansionPanelCustomQuestion(
              testId: testId,
              part: _part,
              documentId: _documentId,
            ),
            for (var questionID in questionIDs)
              ExpansionPanelCustomAnswers(
                  testId: testId,
                  part: _part,
                  documentId: _documentId,
                  questionId: questionID.toString())
          ])),
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
