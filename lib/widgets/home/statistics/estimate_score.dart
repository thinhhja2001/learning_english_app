// ignore_for_file: prefer_final_fields, unused_field, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

class EstimateScore extends StatefulWidget {
  const EstimateScore({Key? key}) : super(key: key);

  @override
  State<EstimateScore> createState() => _EstimateScoreState();
}

class _EstimateScoreState extends State<EstimateScore> {
  double _value = 0.1;
  int estimateListeningScore = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseHandler.estimateListening(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Something Error"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          estimateListeningScore = int.parse(snapshot.data!.toString());
          // print(estimateListeningScore);
          return FutureBuilder(
              future: FirebaseHandler.estimateReading(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text("Something Error"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.black));
                }
                int estimateReadingScore = int.parse(snapshot.data!.toString());
                print(estimateReadingScore);
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
                            child:
                                Stack(alignment: Alignment.center, children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(
                                  value: (estimateListeningScore +
                                          estimateReadingScore) /
                                      990,
                                  backgroundColor: kcBackgroundProgress,
                                  strokeWidth: 5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              ),
                              Text(
                                (estimateListeningScore + estimateReadingScore)
                                    .toString(),
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
                                          text:
                                              estimateListeningScore.toString(),
                                          style: ktsBoldText.copyWith(
                                              color: kcPrimaryColor)),
                                    ],
                                  ),
                                ),
                                verticalSpaceTiny,
                                LinearProgressIndicator(
                                  value: estimateListeningScore / 495,
                                  backgroundColor: kcBackgroundProgress,
                                  minHeight: 5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.purple),
                                ),
                                verticalSpaceSmall,
                                RichText(
                                  text: TextSpan(
                                    text: 'Reading: ',
                                    style: ktsBoldText,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: estimateReadingScore.toString(),
                                          style: ktsBoldText.copyWith(
                                              color: kcPrimaryColor)),
                                    ],
                                  ),
                                ),
                                verticalSpaceTiny,
                                LinearProgressIndicator(
                                  value: estimateReadingScore / 495,
                                  backgroundColor: kcBackgroundProgress,
                                  minHeight: 5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          horizontalSpaceTiny,
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                );
              });
        });
  }
}

// Container(
//       decoration: BoxDecoration(
//         color: kcWhiteColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           verticalSpaceSmall,
//           Text(
//             "Estimate score",
//             style: ktsTitleWidget,
//           ),
//           verticalSpaceSmall,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               horizontalSpaceTiny,
//               SizedBox(
//                 width: 100,
//                 height: 100,
//                 child: Stack(alignment: Alignment.center, children: [
//                   SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: CircularProgressIndicator(
//                       value: _value,
//                       backgroundColor: kcBackgroundProgress,
//                       strokeWidth: 5,
//                       valueColor:
//                           new AlwaysStoppedAnimation<Color>(Colors.green),
//                     ),
//                   ),
//                   Text(
//                     "10",
//                     style: ktsTitleAppBar,
//                   ),
//                 ]),
//               ),
//               horizontalSpaceMedium,
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     RichText(
//                       text: TextSpan(
//                         text: 'Listening: ',
//                         style: ktsBoldText,
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: _value.toString(),
//                               style:
//                                   ktsBoldText.copyWith(color: kcPrimaryColor)),
//                         ],
//                       ),
//                     ),
//                     verticalSpaceTiny,
//                     LinearProgressIndicator(
//                       value: _value,
//                       backgroundColor: kcBackgroundProgress,
//                       minHeight: 5,
//                       valueColor:
//                           new AlwaysStoppedAnimation<Color>(Colors.purple),
//                     ),
//                     verticalSpaceSmall,
//                     RichText(
//                       text: TextSpan(
//                         text: 'Reading: ',
//                         style: ktsBoldText,
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: _value.toString(),
//                               style:
//                                   ktsBoldText.copyWith(color: kcPrimaryColor)),
//                         ],
//                       ),
//                     ),
//                     verticalSpaceTiny,
//                     LinearProgressIndicator(
//                       value: _value,
//                       backgroundColor: kcBackgroundProgress,
//                       minHeight: 5,
//                       valueColor:
//                           new AlwaysStoppedAnimation<Color>(Colors.blue),
//                     ),
//                   ],
//                 ),
//               ),
//               horizontalSpaceTiny,
//             ],
//           ),
//           verticalSpaceSmall,
//         ],
//       ),
//     );
  