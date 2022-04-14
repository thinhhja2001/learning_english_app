import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class AppBarPractisePart extends StatelessWidget with PreferredSizeWidget {
  AppBarPractisePart({
    required this.practiceType,
    required this.title,
    required this.partName,
    Key? key,
  }) : super(key: key);

  final PracticeType practiceType;
  final String partName;
  final String title;

  TextStyle getTitleStyle(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return ktsMiniDescriptionPurple;
    } else if (practiceType == PracticeType.reading) {
      return ktsMiniDescription;
    } else {
      return ktsMiniDescriptionBlack;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: kcWhiteColor,
      toolbarHeight: 60,
      titleSpacing: 0,
      leading: const BackButton(color: Colors.black),
      title: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  title,
                  style: ktsBlackBigTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                partName,
                style: getTitleStyle(practiceType),
              ),
            ],
          )
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
