import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/pratice/user_provider.dart';

import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom/text_in_custom_scroll_view.dart';
import '../../widgets/home/practices/list_practice_card.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: FutureBuilder(
              future: userProvider.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.black));
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something error"));
                } else {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/images/default_avatar.jpg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          userProvider.user.name,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
                }
              })),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: kcGreyColor),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 2,
                    horizontal: kDefaultPadding * 2),
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverToBoxAdapter(child: verticalSpaceSmall),
                    const TextInCustomScrollView(text: "Practice Listening"),
                    ListPracticeCard(
                        practices: listenings,
                        practiceType: PracticeType.listening),
                    const SliverToBoxAdapter(child: verticalSpaceLightLarge),
                    const TextInCustomScrollView(text: "Practice Readings"),
                    ListPracticeCard(
                        practices: readings,
                        practiceType: PracticeType.reading),
                  ],
                ))),
      ),
    );
  }
}
