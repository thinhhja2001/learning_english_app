import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/review_chart_data.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  final TooltipBehavior _tooltipBehavior = TooltipBehavior();
  final List<ReviewChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Result",
              style: kDefaultTextStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
        backgroundColor: kcWhiteColor,
      ),
      body: SafeArea(
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
                    Center(
                        child: SfCircularChart(
                            tooltipBehavior: _tooltipBehavior,
                            legend: Legend(
                                position: LegendPosition.bottom,
                                isVisible: true,
                                orientation: LegendItemOrientation.vertical,
                                overflowMode: LegendItemOverflowMode.wrap),
                            series: <CircularSeries>[
                          // Render pie chart
                          DoughnutSeries<ReviewChartData, String>(
                              legendIconType: LegendIconType.circle,
                              dataSource: chartData,
                              enableTooltip: true,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  textStyle: TextStyle(color: Colors.white)),
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
                              onPressed: () {},
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
      ),
    );
  }
}
