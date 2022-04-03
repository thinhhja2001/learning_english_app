import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_list_scroller.dart';

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
            Center(
              child: Column(children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: SvgPicture.asset('assets/images/empty-box.svg')),
                SizedBox(height: 8),
                Text(
                  'No item here!',
                  style: ktsBlackTitle,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
