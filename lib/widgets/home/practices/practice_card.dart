import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice_selection_screen.dart';
import 'package:learning_english_app/screens/pratice/practise_part2_screen.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../../utils/utils.dart';

class PracticeCard extends StatelessWidget {
  const PracticeCard(
      {Key? key,
      required this.practiceType,
      required this.practiceName,
      required this.icon,
      required this.part})
      : super(key: key);
  final PracticeType practiceType;
  final String practiceName;
  final IconData icon;
  final String part;
  Color getPrimaryColor(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return Colors.purple;
    } else if (practiceType == PracticeType.reading) {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  String getPractiseLink(PracticeType practiceType, String part) {
    if (practiceType == PracticeType.listening) {
      switch (part) {
        case "Part 1":
          return "part1";
        case "Part 2":
          return "part2";
        case "Part 3":
          return "part3";
        case "Part 4":
          return "part4";
        default:
          return "";
      }
    } else {
      switch (part) {
        case "Part 1":
          return "part5";
        case "Part 2":
          return "part6";
        case "Part 3":
          return "part7";
        default:
          return "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = getPrimaryColor(practiceType);
    final Color secondaryColor = lighten(primaryColor, 50);
    final deviceSize = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print(getPractiseLink(practiceType, part));
        //PractisePart2(partLink: getPractiseLink(practiceType, part))
        //PracticeSelectionScreen(practiceType: practiceType)
        Get.to(PractisePart2(partLink: getPractiseLink(practiceType, part)));
      },
      child: Container(
        height: 90,
        width: deviceSize * 0.47,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding * 1.5, right: defaultPadding * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                practiceName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: kDefaultTextStyle.copyWith(
                    color: primaryColor, fontWeight: FontWeight.normal),
              ),
              Container(
                width: deviceSize * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [primaryColor, secondaryColor]),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                      horizontal: defaultHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      Text(
                        part,
                        style: ktsPartText,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
