import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/styles.dart';

class TextInCustomScrollView extends StatelessWidget {
  const TextInCustomScrollView({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: kDefaultTextStyle.copyWith(fontSize: 20),
          ),
          verticalSpaceSmall
        ],
      ),
    );
  }
}
