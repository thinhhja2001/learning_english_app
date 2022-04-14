import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class PracticeSelectionCard extends StatelessWidget {
  const PracticeSelectionCard({
    Key? key,
    required this.title,
    required this.questionCount,
    required this.size,
    required this.takenFrom,
  }) : super(key: key);

  final Color primaryColor = Colors.teal;
  final String title;
  final int questionCount;
  final double size;
  final String takenFrom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kcWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kDefaultTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: h3),
              ),
              Row(
                children: [
                  Text(
                    questionCount.toString(),
                    style: kDefaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                  Text(
                    " questions - ",
                    style: kDefaultTextStyle.copyWith(
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "$size MB",
                    style: kDefaultTextStyle.copyWith(color: primaryColor),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        takenFrom,
                        style: kDefaultTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: h5),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_downward,
                            color: primaryColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.history_rounded,
                            color: primaryColor,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
