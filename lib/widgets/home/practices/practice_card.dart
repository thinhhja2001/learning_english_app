import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/practice_selection_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = getPrimaryColor(practiceType);
    final Color secondaryColor = lighten(primaryColor, 50);
    final deviceSize = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.to(PracticeSelectionScreen(practiceType: practiceType));
      },
      child: Container(
        height: 90,
        width: deviceSize * 0.47,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                practiceName,
                style: kDefaultTextStyle.copyWith(
                    color: primaryColor, fontWeight: FontWeight.normal),
              ),
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
                        icon,
                        color: Colors.white,
                      ),
                      Text(
                        part,
                        style: const TextStyle(color: Colors.white),
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
