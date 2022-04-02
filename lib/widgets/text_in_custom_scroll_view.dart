import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/styles.dart';

class TextInCustomScrollView extends StatelessWidget {
  const TextInCustomScrollView({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            verticalSpaceMedium,
            Text(
              text,
              style: kDefaultTextStyle,
            ),
            verticalSpaceMedium
          ],
        ),
      ),
    );
  }
}
