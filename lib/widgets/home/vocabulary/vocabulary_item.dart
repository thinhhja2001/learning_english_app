import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/screens/vocabulary/vocabulary_list_screen.dart';

import '../../../utils/styles.dart';

class VocabularyItem extends StatelessWidget {
  const VocabularyItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      InkWell(
        onTap: () {
          Get.to(const VocabularyListScreen());
        },
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: ExactAssetImage('assets/images/toeic_image.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.green.shade200,
              width: 6.0,
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Hợp đồng',
        style: ktsBlackTitle,
      ),
      const SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.blue,
          ),
          const SizedBox(width: 2),
          const Text(
            "596/596",
            style: ktsMiniDescription,
          ),
          const SizedBox(width: 8),
        ],
      ),
      const SizedBox(height: 32),
    ]);
  }
}
