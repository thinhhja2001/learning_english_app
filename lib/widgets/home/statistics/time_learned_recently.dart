import 'package:flutter/material.dart';
import 'package:learning_english_app/models/practice/result.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/resources/support_function.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.dateOfWeek, this.target, this.timeLearned);
  final String dateOfWeek;
  final double target;
  final double timeLearned;
}

class Dialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();

  final int val;

  Dialog({
    required this.val,
  });
}

class _DialogState extends State<Dialog> {
  int _currentValue = 0;
  int _oldValue = 0;
  @override
  void initState() {
    super.initState();
    _currentValue = widget.val;
    _oldValue = widget.val;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("Set time target (minute)",
          style: ktsTitleWidget.copyWith(color: kcBlackColor)),
      content: SizedBox(
        height: 50,
        width: 70,
        child: NumberPicker(
          value: _currentValue,
          minValue: 1,
          maxValue: 100,
          itemWidth: 70,
          axis: Axis.horizontal,
          haptics: true,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context, _oldValue),
                child: Text('Cancel',
                    style: ktsBoldText.copyWith(color: kcBlackColor))),
            TextButton(
                onPressed: () => UpdateTarget(),
                child: Text('OK', style: ktsBoldText)),
          ],
        ),
      ],
    );
  }

  UpdateTarget() {
    FirebaseHandler.updateTarget(_currentValue);
    Navigator.pop(context, _currentValue);
  }
}

class TimeLearnedRecently extends StatefulWidget {
  TimeLearnedRecently({Key? key}) : super(key: key);

  @override
  State<TimeLearnedRecently> createState() => _TimeLearnedRecentlyState();
}

class _TimeLearnedRecentlyState extends State<TimeLearnedRecently> {
  var d = DateTime.now();

  var weekDay = {"CN", "T2", "T3", "T4", "T5", "T6", "T7"};
  DateTime now = DateTime.now();
  double _target = 10;

  @override
  Widget build(BuildContext context) {
    var numWeekDay = d.weekday;
    now = DateTime(d.year, d.month, d.day, 23, 59);
    return FutureBuilder(
        future: FirebaseHandler.getTarget(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.data == null)
            _target = 10;
          else
            _target = (snapshot.data! * 1.0);
          return FutureBuilder(
              future: FirebaseHandler.getTimeLearned(),
              builder: (context, AsyncSnapshot<List<Result>> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text("Something Error"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.black));
                }
                List<Result> lResult =
                    snapshot.data!.map((doc) => doc).toList();
                List<int> lTimeLearned = [0, 0, 0, 0, 0, 0, 0];
                if (lResult.isNotEmpty) {
                  lResult.forEach((result) {
                    DateTime timeLearned =
                        DateTime.parse(result.time!.toDate().toString());
                    int differ = timeLearned.difference(now).inDays;
                    if (differ <= 0 && differ >= -6)
                      lTimeLearned[6 + differ] +=
                          SupportFunction.toMinutes(result.duration ?? 0);
                  });
                }
                List<ChartData> chartData = [
                  ChartData(
                      weekDay.elementAt((numWeekDay - 6) < 0
                          ? (numWeekDay + 1)
                          : (numWeekDay - 6)),
                      _target,
                      lTimeLearned[0] * 1.0),
                  ChartData(
                      weekDay.elementAt((numWeekDay - 5) < 0
                          ? (numWeekDay + 2)
                          : (numWeekDay - 5)),
                      _target,
                      lTimeLearned[1] * 1.0),
                  ChartData(
                      weekDay.elementAt((numWeekDay - 4) < 0
                          ? (numWeekDay + 3)
                          : (numWeekDay - 4)),
                      _target,
                      lTimeLearned[2] * 1.0),
                  ChartData(
                      weekDay.elementAt((numWeekDay - 3) < 0
                          ? (numWeekDay + 4)
                          : (numWeekDay - 3)),
                      _target,
                      lTimeLearned[3] * 1.0),
                  ChartData(
                      weekDay.elementAt((numWeekDay - 2) < 0
                          ? (numWeekDay + 5)
                          : (numWeekDay - 2)),
                      _target,
                      lTimeLearned[4] * 1.0),
                  ChartData(
                      weekDay.elementAt((numWeekDay - 1) < 0
                          ? (numWeekDay + 6)
                          : (numWeekDay - 1)),
                      _target,
                      lTimeLearned[5] * 1.0),
                  ChartData("Today", _target, lTimeLearned[6] * 1.0),
                ];

                return Container(
                  decoration: BoxDecoration(
                    color: kcWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      Text(
                        "Time learned recently (minute)",
                        style: ktsTitleWidget,
                      ),
                      verticalSpaceSmall,
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            // Renders target line chart
                            LineSeries<ChartData, String>(
                                dataSource: chartData,
                                color: kcWrong,
                                xValueMapper: (ChartData data, _) =>
                                    data.dateOfWeek,
                                yValueMapper: (ChartData data, _) =>
                                    data.target,
                                markerSettings:
                                    MarkerSettings(isVisible: true)),
                            LineSeries<ChartData, String>(
                                dataSource: chartData,
                                color: kcPrimaryColor,
                                xValueMapper: (ChartData data, _) =>
                                    data.dateOfWeek,
                                yValueMapper: (ChartData data, _) =>
                                    data.timeLearned,
                                markerSettings: MarkerSettings(isVisible: true))
                          ]),
                      verticalSpaceSmall,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => Dialog(
                                val: _target.round(),
                              ),
                            ).then((valueFromDialog) {
                              // use the value as you wish
                              if (_target != valueFromDialog)
                                setState(() {
                                  _target = valueFromDialog;
                                });
                            });
                          },
                          child: Text("Set time target"),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kcWhiteColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kcPrimaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                // side: BorderSide(color: Colors.red)
                              ))),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
