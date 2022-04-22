import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FavoriteParts extends StatefulWidget {
  final String title;
  const FavoriteParts({Key? key, required this.title}) : super(key: key);

  @override
  State<FavoriteParts> createState() => _FavoritePartsState();
}

class _FavoritePartsState extends State<FavoriteParts> {
  IconData? iconPart;
  Color colorPart = kcSecondBackgroundButton;
  bool isPressed = false;

  void changeBackground() {
    if (isPressed == true) {
      iconPart = null;
      colorPart = kcSecondBackgroundButton;
      isPressed = false;
    } else {
      isPressed = true;
      iconPart = Icons.check;
      colorPart = kPrimaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ElevatedButton(
        child: Text(widget.title),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorPart),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
        onPressed: () {
          setState(() {
            changeBackground();
          });
        },
      ),
    );
  }
}
