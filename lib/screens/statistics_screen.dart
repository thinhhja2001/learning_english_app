import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/drop_down_time.dart';
import 'package:learning_english_app/widgets/estimate_score.dart';
import 'package:learning_english_app/widgets/overall.dart';
import 'package:learning_english_app/widgets/time_learned_recently.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: ktsTitleAppBar,
        ),
        backgroundColor: kcWhiteColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          DropDownTime(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EstimateScore(),
            verticalSpaceSmall,
            TimeLearnedRecently(),
            verticalSpaceSmall,
            Overall(),
          ],
        ),
      ),
    );
  }
}
