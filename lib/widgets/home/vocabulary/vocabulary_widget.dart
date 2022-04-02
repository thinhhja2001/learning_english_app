import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../../screens/vocabulary/vocabulary_list_screen.dart';

class VocabularyGeneral extends StatefulWidget {
  const VocabularyGeneral({Key? key}) : super(key: key);

  @override
  _VocabularyGeneralState createState() => _VocabularyGeneralState();
}

class _VocabularyGeneralState extends State<VocabularyGeneral> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulary"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                "TOEIC vocabulary",
                style: TextStyle(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: h3,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            VocabularyListScroller(),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            Container(
              child: Text(
                "My vocabulary set",
                style: TextStyle(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: h3,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}

class VocabularyListScroller extends StatelessWidget {
  const VocabularyListScroller();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double categoryHeight = screenSize.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
              VocabularyGeneralContainer(
                screenSize: screenSize,
                title: "600 từ vựng TOEIC",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VocabularyGeneralContainer extends StatelessWidget {
  const VocabularyGeneralContainer({
    Key? key,
    required this.screenSize,
    required this.title,
  }) : super(key: key);

  final Size screenSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = screenSize.height * 0.30 - 80;
    return Container(
      width: screenSize.width * 0.45,
      margin: EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: InkWell(
        onTap: () {
          Get.to(VocabularyListScreen());
        },
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54])
                    .createShader(
                        Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("assets/images/toeic_image.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: h4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 10,
                ),
                VocabularyGenralPoint(
                  pointText: "20/596",
                  reviewText: "200",
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class VocabularyGenralPoint extends StatelessWidget {
  const VocabularyGenralPoint({
    Key? key,
    required this.pointText,
    required this.reviewText,
  }) : super(key: key);

  final String pointText;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.blue,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              pointText,
              style: TextStyle(
                  fontSize: h6,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.timelapse,
              color: Colors.blue,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              reviewText,
              style: TextStyle(
                  fontSize: h6,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            )
          ],
        ),
      ),
    );
  }
}
