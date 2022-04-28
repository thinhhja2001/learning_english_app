import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/review_chart_data.dart';
import '../../../providers/pratice/dialog_quiz_controller.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({
    Key? key,
  }) : super(key: key);

  final TooltipBehavior _tooltipBehavior = TooltipBehavior();
  final SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    DialogQuizProvider dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);

    print(
        "gia tri correct ${dialogQuizProvider.numberCorrect} gia tri in correct ${dialogQuizProvider.numberInCorrect} gia tri un select ${dialogQuizProvider.numberUnSelect}");

    List<ReviewChartData> chartData = [
      ReviewChartData(
          x: 'Correct answer',
          y: dialogQuizProvider.numberCorrect,
          color: Colors.green),
      ReviewChartData(
          x: 'Wrong answer',
          y: dialogQuizProvider.numberInCorrect,
          color: Colors.red),
      ReviewChartData(
          x: 'Unselected answer',
          y: dialogQuizProvider.numberUnSelect,
          color: Colors.grey),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(kDefaultBorderRadius)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Your Result",
                      style: kDefaultTextStyle,
                    ),
                  ),
                  Center(
                      child: SfCircularChart(
                          tooltipBehavior: _tooltipBehavior,
                          legend: Legend(
                              position: LegendPosition.bottom,
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap),
                          series: <CircularSeries>[
                        // Render pie chart
                        DoughnutSeries<ReviewChartData, String>(
                            legendIconType: LegendIconType.circle,
                            dataSource: chartData,
                            enableTooltip: true,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                            pointColorMapper: (ReviewChartData data, _) =>
                                data.color,
                            xValueMapper: (ReviewChartData data, _) => data.x,
                            yValueMapper: (ReviewChartData data, _) => data.y)
                      ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => swiperController.move(0),
                            child: const Text("Review"),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(kDefaultBorderRadius),
                              )),
                            )),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
