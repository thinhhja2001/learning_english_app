import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/review_chart_data.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
    required TooltipBehavior tooltipBehavior,
    required this.chartData,
    required this.swiperController,
  })  : _tooltipBehavior = tooltipBehavior,
        super(key: key);

  final TooltipBehavior _tooltipBehavior;
  final List<ReviewChartData> chartData;
  final SwiperController swiperController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
