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
        title: const Text("Vocabulary"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("TOEIC vocabulary", style: ktsBlackBigTitle),
            SizedBox(height: screenSize.height * 0.015),
            const VocabularyListScroller(),
            SizedBox(height: screenSize.height * 0.015),
            const Text("My vocabulary set", style: ktsBlackBigTitle),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            Center(
              child: Column(children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: SvgPicture.asset('assets/images/empty-box.svg')),
                const SizedBox(height: 8),
                const Text(
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
