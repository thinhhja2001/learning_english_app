// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice_file.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';

import '../../models/practice.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../widgets/home/practices/practice_selection_card.dart';

class PracticeSelectionScreen extends StatelessWidget {
  const PracticeSelectionScreen({Key? key, required this.practice})
      : super(key: key);
  final Practice practice;
  Color getTitleColor(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return Colors.purple;
    } else if (practiceType == PracticeType.reading) {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.teal;
    var size = MediaQuery.of(context).size;
    final Color titleColor = getTitleColor(practice.practiceType);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              practicePartName[practice.practicePart.index],
              style: kDefaultTextStyle.copyWith(fontSize: 20),
            ),
            Text(
              practicePartTitle[practice.practicePart.index],
              style: kDefaultTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: titleColor),
            )
          ],
        ),
        backgroundColor: kcWhiteColor,
      ),
      body: FutureBuilder<List<PracticeFile>>(
          future: FirebaseHandler.getListTest(practice),
          builder: (BuildContext context,
              AsyncSnapshot<List<PracticeFile>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text("Something Error"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.black));
            }

            List<PracticeFile> fileList = [];
            fileList = snapshot.data!.map((doc) => doc).toList();
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: AnimationLimiter(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: fileList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredGrid(
                              columnCount: 2,
                              position: index,
                              duration: Duration(milliseconds: 1000),
                              child: ScaleAnimation(
                                  child: FadeInAnimation(
                                      delay: Duration(milliseconds: 100),
                                      child: PracticeSelectionCard(
                                          practiceFile: fileList[index]))));
                        })));
          }),
    );
  }

  Widget listItem(PracticeFile practiceFile) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            practiceFile.fileTitle!,
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
