import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

class EstimateScore extends StatefulWidget {
  EstimateScore({Key? key}) : super(key: key);

  @override
  State<EstimateScore> createState() => _EstimateScoreState();
}

class _EstimateScoreState extends State<EstimateScore> {
  double _value = 0.1;

  bool _isAll = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Text(
            "Estimate score",
            style: ktsTitleWidget,
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              horizontalSpaceTiny,
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: _value,
                      backgroundColor: kcBackgroundProgress,
                      strokeWidth: 5,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  Text(
                    "10",
                    style: ktsTitleAppBar,
                  ),
                ]),
              ),
              horizontalSpaceMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Listening: ',
                        style: ktsBoldText,
                        children: <TextSpan>[
                          TextSpan(
                              text: _value.toString(),
                              style:
                                  ktsBoldText.copyWith(color: kcPrimaryColor)),
                        ],
                      ),
                    ),
                    verticalSpaceTiny,
                    LinearProgressIndicator(
                      value: _value,
                      backgroundColor: kcBackgroundProgress,
                      minHeight: 5,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                    verticalSpaceSmall,
                    RichText(
                      text: TextSpan(
                        text: 'Reading: ',
                        style: ktsBoldText,
                        children: <TextSpan>[
                          TextSpan(
                              text: _value.toString(),
                              style:
                                  ktsBoldText.copyWith(color: kcPrimaryColor)),
                        ],
                      ),
                    ),
                    verticalSpaceTiny,
                    LinearProgressIndicator(
                      value: _value,
                      backgroundColor: kcBackgroundProgress,
                      minHeight: 5,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ],
                ),
              ),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _isAll
                  ? ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: kcWhiteColor,
                        size: 20,
                      ),
                      label: Text("By all part"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(kcWhiteColor),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kcPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAll = true;
                        });
                      },
                      child: Text("By all parts"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(kcWhiteColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kcSecondBackgroundButton),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                    ),
              !_isAll
                  ? ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: kcWhiteColor,
                        size: 20,
                      ),
                      label: Text("By learned parts"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(kcWhiteColor),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kcPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAll = false;
                        });
                      },
                      child: Text("By learned part"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(kcWhiteColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kcSecondBackgroundButton),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
