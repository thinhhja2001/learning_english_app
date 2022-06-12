import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';

import '../../utils/styles.dart';

class MenuPart extends StatelessWidget {
  const MenuPart({Key? key, required this.title, required this.icon})
      : super(key: key);
  // ignore: non_constant_identifier_names

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                flex: 1,
                child: Icon(
                  icon,
                  color: kPrimaryColor,
                )),
            Expanded(
              flex: 4,
              child: Text(
                title,
                style: kDefaultTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
