// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/practice/practice.dart';
import 'package:learning_english_app/models/practice/practice_file.dart';
import 'package:learning_english_app/providers/favorite_provider.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../models/favorite.dart';
import '../../../providers/pratice/dialog_quiz_controller.dart';
import '../../../providers/pratice/loading_provider.dart';
import '../../../providers/pratice/page_quiz_provider.dart';
import '../../../screens/practice/page_quiz_screen.dart';

class FavoriteCard extends StatefulWidget {
  final List<Map<String, dynamic>>? Questions;
  final String title;
  final IconData? icon;
  final Color? color;
  const FavoriteCard(
      {Key? key, this.Questions, required this.title, this.icon, this.color})
      : super(key: key);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  IconData titleIcon = Icons.arrow_drop_down;
  bool showDrop = false;
  List<Favorite> titleChildren = [];

  PracticeFile getPractice(String part, String test) {
    Practice? practice;
    switch (part) {
      case "part1":
        practice = listenings[0];
        break;
      case "part2":
        practice = listenings[1];
        break;
      case "part3":
        practice = listenings[2];
        break;
      case "part4":
        practice = listenings[3];
        break;
      case "part5":
        practice = readings[0];
        break;
      case "part6":
        practice = readings[1];
        break;
      default:
        practice = readings[2];
        break;
    }
    PracticeFile practiceFile = PracticeFile.fromFireStore(test, practice);
    return practiceFile;
  }

  pressItem(LoadingProvider loadingProvider, PageQuizProvider pageQuizProvider,
      DialogQuizProvider dialogQuizProvider, PracticeFile practiceFile) async {
    loadingProvider.updateLoading();

    await pageQuizProvider.updatePractice(practiceFile);
    await dialogQuizProvider.getAllQuestion(
        practiceFile.id!, practiceFile.practice.practicePart.name);

    loadingProvider.updateLoading();

    Get.to(PageQuizScreen());
  }

  void onTitleClick() {
    if (titleIcon == Icons.arrow_drop_down) {
      titleIcon = Icons.arrow_drop_up;
    } else {
      titleIcon = Icons.arrow_drop_down;
    }
    showDrop = !showDrop;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FavoriteProvider favoriteProvider =
          Provider.of<FavoriteProvider>(context);
      // ignore: avoid_print
      titleChildren = favoriteProvider.favorites
          .where((element) => element.title == widget.title)
          .toList();
    });
    setState(() {});
    super.initState();
  }

  void deleteElement(int index) {}

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context);
    PageQuizProvider pageQuizProvider = Provider.of<PageQuizProvider>(context);
    DialogQuizProvider dialogQuizProvider =
        Provider.of<DialogQuizProvider>(context);
    titleChildren = favoriteProvider.favorites
        .where((element) => element.title == widget.title)
        .toList();
    int length = titleChildren.length;
    Size screenSize = MediaQuery.of(context).size;
    return length == 0
        ? SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: screenSize.width * 0.95,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onTitleClick();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: showDrop
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))
                            : BorderRadius.all(Radius.circular(10)),
                      ),
                      primary: kcWhiteColor,
                      onPrimary: kcWhiteColor,
                      splashFactory: NoSplash.splashFactory),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: kcBlackColor,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("$length favorites questions",
                              style: TextStyle(color: kcPrimaryTextColor)),
                        ],
                      ),
                      Icon(
                        titleIcon,
                        size: 24.0,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              showDrop
                  ? Container(
                      width: screenSize.width * 0.95,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: length,
                          itemBuilder: (BuildContext context, int index) {
                            String questionIndex = "Question " +
                                titleChildren[index].index.toString();

                            String time = DateFormat('dd/MM/yyyy hh:mm a')
                                .format(titleChildren[index].time!.toDate());

                            String part = titleChildren[index]
                                .part!
                                .replaceFirst(RegExp(r't'), 't ');
                            return Container(
                              color: Colors.black26,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      primary: kcWhiteColor,
                                      onPrimary: kcWhiteColor,
                                      splashFactory: NoSplash.splashFactory),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pressItem(
                                            loadingProvider,
                                            pageQuizProvider,
                                            dialogQuizProvider,
                                            getPractice(
                                                titleChildren[index].part!,
                                                titleChildren[index].test!),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  // <-- Icon
                                                  Icons.question_mark,
                                                  size: 24.0,
                                                  color: kcPrimaryColor,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  questionIndex,
                                                  style: TextStyle(
                                                      color: kcBlackColor,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: kcPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      part,
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  time,
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: kcPrimaryTextColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            FirebaseHandler.deleteFromFavorite(
                                                titleChildren[index].test!,
                                                titleChildren[index].part!,
                                                titleChildren[index].index!);
                                            favoriteProvider.favorites.removeWhere(
                                                (element) =>
                                                    element.id ==
                                                    titleChildren[index].id);
                                          });
                                        },
                                        child: Icon(
                                          // <-- Icon
                                          Icons.delete,
                                          size: 24.0,
                                          color: kcSecondBackgroundButton,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : SizedBox(),
            ],
          );
  }
}
