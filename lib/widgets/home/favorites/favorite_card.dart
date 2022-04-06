import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/styles.dart';

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

  void onTitleClick() {
    if (titleIcon == Icons.arrow_drop_down) {
      titleIcon = Icons.arrow_drop_up;
    } else {
      titleIcon = Icons.arrow_drop_down;
    }
    showDrop = !showDrop;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
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
                    Text("3 favorites questions",
                        style: TextStyle(color: kcPrimaryTextColor)),
                  ],
                ),
                Icon(
                  // <-- Icon
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
                color: Colors.black26,
                width: screenSize.width * 0.95,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            Row(
                              children: [
                                Icon(
                                  // <-- Icon
                                  Icons.check,
                                  size: 24.0,
                                  color: kcPrimaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Question 101",
                                  style: TextStyle(
                                      color: kcBlackColor,
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Note",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontFamily: 'Roboto',
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: kcPrimaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Part 1",
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
                                  "At 03:19 05-04-2022",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: kcPrimaryTextColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Icon(
                          // <-- Icon
                          Icons.delete,
                          size: 24.0,
                          color: kcSecondBackgroundButton,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
