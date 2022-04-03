import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_general_point.dart';

import '../../../screens/vocabulary/vocabulary_list_screen.dart';
import '../../../utils/styles.dart';

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
