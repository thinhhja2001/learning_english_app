// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/favorite_vocabulary.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/screens/vocabulary/favorite_scambled_screen.dart';
import 'package:learning_english_app/widgets/home/vocabulary/appbar_favorite_word.dart';
import 'package:learning_english_app/widgets/home/vocabulary/word_favorite_item.dart';

import '../../utils/constants.dart';

class FavoriteWordListScreen extends StatelessWidget {
  const FavoriteWordListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFavoriteWordWidget(),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseHandler.getListFavorite(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.black));
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something error"));
              }

              List<FavoriteWord> favoriteList = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                FavoriteWord favorite = FavoriteWord.fromSnap(document);
                favoriteList.add(favorite);
              }).toList();

              return Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: AnimationLimiter(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 5.5,
                                      mainAxisSpacing: 10),
                              itemCount: favoriteList.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                return index < favoriteList.length
                                    ? AnimationConfiguration.staggeredGrid(
                                        columnCount: 1,
                                        position: index,
                                        duration: Duration(milliseconds: 1000),
                                        child: ScaleAnimation(
                                            child: FadeInAnimation(
                                                delay:
                                                    Duration(milliseconds: 100),
                                                child: WordFavoriteItem(
                                                    favoriteWord:
                                                        favoriteList[index],
                                                    index: index))))
                                    : verticalSpaceLarge;
                              }))),
                  favoriteList.isNotEmpty
                      ? Positioned(
                          bottom: 20,
                          left: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.width * 0.56,
                          height: 70,
                          child: Card(
                            elevation: 10,
                            color: Colors.pink,
                            margin: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white54, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(FavaoriteScrambleScreen(
                                    listFavorite: favoriteList,
                                    topic: "Favorite"));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.quiz_outlined,
                                    color: Colors.white,
                                  ),
                                  Text('Word Scrambled Game',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              );
            }));
  }
}
