import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/custom_error_box.dart';
import 'package:learning_english_app/widgets/home/practices/practice_card.dart';

import '../../text_in_custom_scroll_view.dart';
import 'list_practice_card.dart';

class PracticeWidget extends StatelessWidget {
  const PracticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage("assets/images/default_avatar.jpg"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: defaultPadding * 3),
                      child: Text(
                        "Thịnh Nguyễn",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xffc3ced4)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 2,
                          horizontal: defaultPadding * 2),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          const TextInCustomScrollView(
                              text: "Practice Listening"),
                          ListPracticeCard(
                            practiceType: PracticeType.listening,
                            practices: listenings,
                          ),
                          const TextInCustomScrollView(
                              text: "Practice Readings"),
                          ListPracticeCard(
                            practiceType: PracticeType.reading,
                            practices: readings,
                          ),
                          const TextInCustomScrollView(
                            text: "Test",
                          ),
                          ListPracticeCard(
                            practiceType: PracticeType.test,
                            practices: tests,
                          )
                        ],
                      ))))
        ],
      ),
    );
  }
}
