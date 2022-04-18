import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:learning_english_app/models/user.dart' as appUser;
import 'package:learning_english_app/providers/authentication/signin_provider.dart';

import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:learning_english_app/utils/styles.dart';
import 'package:learning_english_app/widgets/custom/custom_error_box.dart';
import 'package:learning_english_app/widgets/home/practices/practice_card.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication/signin_provider.dart';
import '../../widgets/custom/text_in_custom_scroll_view.dart';
import '../../widgets/home/practices/list_practice_card.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage("assets/images/default_avatar.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding * 3),
                      child: Text(
                        signInProvider.currentUser.name,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: kcGreyColor),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding * 2,
                          horizontal: kDefaultPadding * 2),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          const TextInCustomScrollView(
                              text: "Practice Listening"),
                          ListPracticeCard(
                              practices: listenings,
                              practiceType: PracticeType.listening),
                          const TextInCustomScrollView(
                              text: "Practice Readings"),
                          ListPracticeCard(
                              practices: readings,
                              practiceType: PracticeType.reading),
                          const TextInCustomScrollView(
                            text: "Test",
                          ),
                          ListPracticeCard(
                              practices: tests, practiceType: PracticeType.test)
                        ],
                      ))))
        ],
      ),
    );
  }
}
