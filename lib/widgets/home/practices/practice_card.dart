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
        height: 50,
        width: deviceSize * 0.47,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Text(
                practicePartTitle[practice.practicePart.index],
                style: kDefaultTextStyle.copyWith(
                    color: primaryColor, fontWeight: FontWeight.normal),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        IconData(int.parse('0x${practice.iconData}'),
                            fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                      ),
                      Text(
                        practicePartName[practice.practicePart.index],
                        style: const TextStyle(color: Colors.white),
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
