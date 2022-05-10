// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning_english_app/models/vocabulary/favorite_vocabulary.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';
import 'package:learning_english_app/widgets/home/vocabulary/appbar_favorite_word.dart';
import 'package:learning_english_app/widgets/home/vocabulary/word_favorite_item.dart';

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

              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: AnimationLimiter(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 5.5,
                                  mainAxisSpacing: 10),
                          itemCount: favoriteList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredGrid(
                                columnCount: 1,
                                position: index,
                                duration: Duration(milliseconds: 1000),
                                child: ScaleAnimation(
                                    child: FadeInAnimation(
                                        delay: Duration(milliseconds: 100),
                                        child: WordFavoriteItem(
                                            favoriteWord: favoriteList[index],
                                            index: index))));
                          })));
            }));
  }
}
