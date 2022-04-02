import 'package:flutter/material.dart';
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
                onPressed: () => Navigator.pop(context, _currentValue),
                child: Text('OK', style: ktsBoldText)),
          ],
        ),
      ],
    );
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

  double _target = 30;

  @override
  Widget build(BuildContext context) {
    var numWeekDay = d.weekday;
    List<ChartData> chartData = [
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 6) < 0 ? (numWeekDay + 1) : (numWeekDay - 6)),
          _target,
          0),
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 5) < 0 ? (numWeekDay + 2) : (numWeekDay - 5)),
          _target,
          0),
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 4) < 0 ? (numWeekDay + 3) : (numWeekDay - 4)),
          _target,
          0),
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 3) < 0 ? (numWeekDay + 4) : (numWeekDay - 3)),
          _target,
          0),
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 2) < 0 ? (numWeekDay + 5) : (numWeekDay - 2)),
          _target,
          0),
      ChartData(
          weekDay.elementAt(
              (numWeekDay - 1) < 0 ? (numWeekDay + 6) : (numWeekDay - 1)),
          _target,
          0),
      ChartData("Hôm nay", _target, 0),
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
          SfCartesianChart(primaryXAxis: CategoryAxis(), series: <ChartSeries>[
            // Renders target line chart
            LineSeries<ChartData, String>(
                dataSource: chartData,
                color: kcWrong,
                xValueMapper: (ChartData data, _) => data.dateOfWeek,
                yValueMapper: (ChartData data, _) => data.target,
                markerSettings: MarkerSettings(isVisible: true)),
            LineSeries<ChartData, String>(
                dataSource: chartData,
                color: kcPrimaryColor,
                xValueMapper: (ChartData data, _) => data.dateOfWeek,
                yValueMapper: (ChartData data, _) => data.timeLearned,
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
                  setState(() {
                    _target = valueFromDialog;
                  });
                  print(valueFromDialog);
                });
              },
              child: Text("Set time target"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(kcWhiteColor),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kcPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    // side: BorderSide(color: Colors.red)
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
