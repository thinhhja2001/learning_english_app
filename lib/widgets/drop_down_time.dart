import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';

class DropDownTime extends StatefulWidget {
  const DropDownTime({Key? key}) : super(key: key);

  @override
  State<DropDownTime> createState() => _DropDownTime();
}

class _DropDownTime extends State<DropDownTime> {
  String dropdownValue = 'Last 7 days';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 35),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_rounded),
        elevation: 16,
        style: const TextStyle(color: kcPrimaryColor),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          "Today",
          'Last 7 days',
          'Last 30 days',
          'Last 3 month',
          'Last 6 month',
          'Last year',
          'Life time'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
