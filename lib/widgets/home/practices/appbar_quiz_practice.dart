// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../providers/pratice/dialog_quiz_controller.dart';
import '../../../providers/pratice/page_quiz_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/styles.dart';
import '../../../utils/utils.dart';
import 'dialog_list_answer.dart';

class AppBarQuizPractice extends StatelessWidget with PreferredSizeWidget {
  const AppBarQuizPractice({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    DialogQuizProvider dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);

    PageQuizProvider _pageQuizProvider = Provider.of<PageQuizProvider>(context);
    return AppBar(
      leading: IconButton(
          onPressed: () {
            dialogQuizProvider.disposeValue();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(
        _pageQuizProvider.practiceFile.fileTitle!,
        style: kDefaultTextStyle.copyWith(fontSize: 20),
      ),
      backgroundColor: kcWhiteColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.checklist,
            color: Colors.black,
          ),
          onPressed: () {
            Get.dialog(DialogListAnswer().marginAll(20));
          },
        )
      ],
    );
  }
}
