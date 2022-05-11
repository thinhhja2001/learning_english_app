import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice/practice_selection_screen.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../../models/practice/practice.dart';
import '../../../utils/utils.dart';

class PracticeCard extends StatelessWidget {
  const PracticeCard({Key? key, required this.practice}) : super(key: key);
  final Practice practice;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = getPrimaryColor(practice.practiceType);
    final Color secondaryColor = lighten(primaryColor, 50);
    final deviceSize = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.to(PracticeSelectionScreen(practice: practice));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  practicePartTitle[practice.practicePart.index],
                  overflow: TextOverflow.ellipsis,
                  style: kDefaultTextStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              verticalSpaceSmall,
              Container(
                width: deviceSize * 0.25,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [primaryColor, secondaryColor]),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        IconData(int.parse('0x${practice.iconData}'),
                            fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                      ),
                      Text(
                        practicePartName[practice.practicePart.index],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
