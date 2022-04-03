import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class WordItem extends StatelessWidget {
  const WordItem({
    Key? key,
    required double progressValue,
    required this.screenSize,
  })  : _progressValue = progressValue,
        super(key: key);

  final double _progressValue;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: 0.2,
                      strokeWidth: 5,
                      backgroundColor: Colors.green.shade100,
                      color: Colors.green.shade400,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  Center(
                    child: Text('${(_progressValue * 100).round()}%',
                        style: ktsCircleProgress),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("abide by", style: ktsTitle),
                Row(
                  children: [
                    Text(
                      "(verb)",
                      style: ktsDescriptionItalic,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(" "),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Text(
                          "tôn trọng, tuân thủ aaaaaaaaaaaaaaaaaaaaaaaaa",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: ktsDescription),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
