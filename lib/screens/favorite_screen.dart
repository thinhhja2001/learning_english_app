import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/widgets/home/favorites/favorite_card.dart';
import 'package:learning_english_app/widgets/home/favorites/parts_widget.dart';
import 'package:learning_english_app/widgets/home/favorites/search_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool searchShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.loop)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
        ],
        backgroundColor: kcWhiteColor,
        foregroundColor: kcBlackColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 20,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          searchShow = !searchShow;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down)),
                ),
                FavoriteParts(title: "All"),
                FavoriteParts(title: "Part 1"),
                FavoriteParts(title: "Part 2"),
                FavoriteParts(title: "Part 3"),
                FavoriteParts(title: "Part 4"),
                FavoriteParts(title: "Part 5"),
                FavoriteParts(title: "Part 6"),
                FavoriteParts(title: "Part 7"),
              ],
            ),
          ),
          searchShow ? SearchFavorite() : SizedBox(),
          SizedBox(
            height: searchShow ? 5 : 20,
          ),
          FavoriteCard(title: "Photographs 02"),
        ],
      ),
    );
  }
}
