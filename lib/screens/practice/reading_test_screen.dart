import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice.dart';
import 'package:learning_english_app/providers/reading_provider.dart';
import 'package:learning_english_app/screens/practice/list_answer_widget.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_english_app/widgets/body_part6.dart';
import 'package:provider/provider.dart';

class ReadingTestScreen extends StatefulWidget {
  final Practice practice;
  const ReadingTestScreen({Key? key, required this.practice}) : super(key: key);

  @override
  State<ReadingTestScreen> createState() => _ReadingTestScreenState();
}

class _ReadingTestScreenState extends State<ReadingTestScreen> {
  String questionNumber = "131-134";
  String questionDescript = "refer to the following press release.";
  var _expanded = true;

  DocumentSnapshot? snapshot = null; //Define snapshot

  late List<String> descriptions;
  var scripts = <String>[];
  late List<String> question;
  late List<String> answers;
  late List<String> answer;

  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .doc('131-134')
        .get(); //get the data
    snapshot = data;
    // print(snapshot!.data().toString());
    FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .doc('131-134')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        print('Document data: ${documentSnapshot.data()}');
      }
    });
    FirebaseFirestore.instance
        .collection("tests")
        .doc('test1')
        .collection("part6")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["script"]);
        scripts.add("1");
        scripts.add(doc["script"].toString());
        print(scripts.elementAt(1));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final readingProvider = Provider.of<ReadingProvider>(context);
    readingProvider.getData();
    // getData();
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
                widget.practice.name,
                style: kDefaultTextStyle.copyWith(fontSize: 20),
              ),
              Text(
                "Question " + questionNumber,
                style: kDefaultTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kcCorrect),
              )
            ],
          ),
          actions: [
            Center(
              child: TweenAnimationBuilder<Duration>(
                  duration: Duration(minutes: 3),
                  tween: Tween(begin: Duration(minutes: 3), end: Duration.zero),
                  onEnd: () {
                    print('Timer ended');
                  },
                  builder:
                      (BuildContext context, Duration value, Widget? child) {
                    final minutes = value.inMinutes;
                    final seconds = value.inSeconds % 60;
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text('$minutes:$seconds',
                            textAlign: TextAlign.center, style: ktsCountdown));
                  }),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.format_list_numbered_rounded)),
          ],
          backgroundColor: kcWhiteColor,
          foregroundColor: kcBlackColor,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ExpansionPanelCustomQuestion("131-134"),
              ExpansionPanelCustomAnswers("131"),
              ExpansionPanelCustomAnswers("132"),
              ExpansionPanelCustomAnswers("133"),
              ExpansionPanelCustomAnswers("134"),
            ],
          ),
        ));
  }
}
