import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice/review_chart_data.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../providers/pratice/dialog_quiz_controller.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({
    Key? key,
  }) : super(key: key);

  final TooltipBehavior _tooltipBehavior = TooltipBehavior();

  @override
  Widget build(BuildContext context) {
    DialogQuizProvider dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);
    final result = dialogQuizProvider.result;
    print(
        "gia tri correct ${result.numberCorrect} gia tri in correct ${result.numberInCorrect} gia tri un select ${result.numberUnSelect}");

    List<ReviewChartData> chartData = [
      ReviewChartData(
          x: 'Correct answer', y: result.numberCorrect, color: Colors.green),
      ReviewChartData(
          x: 'Wrong answer', y: result.numberInCorrect, color: Colors.red),
      ReviewChartData(
          x: 'Unselected answer', y: result.numberUnSelect, color: Colors.grey),
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        style: kTitle,
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
                              onPressed: () {
                                dialogQuizProvider.disposeValue();
                                Get.back();
                              },
                              child: const Text("Go Back"),
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
      ),
    );
  }
}
