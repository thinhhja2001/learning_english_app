import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/favorite_provider.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/widgets/home/favorites/favorite_card.dart';
import 'package:learning_english_app/widgets/home/favorites/parts_widget.dart';
import 'package:learning_english_app/widgets/home/favorites/search_favorite.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool searchShow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FavoriteProvider favoriteProvider =
          Provider.of<FavoriteProvider>(context, listen: false);
      // ignore: avoid_print
      favoriteProvider.getAllFavoriteData();
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: kcGreyColor,
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),

        backgroundColor: kcWhiteColor,
        foregroundColor: kcBlackColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // SizedBox(
                  //   height: 20,
                  //   child: IconButton(
                  //       onPressed: () {
                  //         setState(() {
                            
                  //         });
                  //       },
                  //       icon: const Icon(Icons.arrow_drop_down)),
                  // ),
                  const FavoriteParts(
                    title: "All",
                    index: 0,
                  ),
                  const FavoriteParts(title: "Part 1", index: 1),
                  const FavoriteParts(title: "Part 2", index: 2),
                  const FavoriteParts(title: "Part 3", index: 3),
                  const FavoriteParts(title: "Part 4", index: 4),
                  const FavoriteParts(title: "Part 5", index: 5),
                  const FavoriteParts(title: "Part 6", index: 6),
                  const FavoriteParts(title: "Part 7", index: 7),
                ],
              ),
            ),
            searchShow ? const SearchFavorite() : const SizedBox(),
            SizedBox(
              height: searchShow ? 5 : 20,
            ),
            favoriteProvider.loading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favoriteProvider.listTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          FavoriteCard(
                              title: favoriteProvider.listTitle[index]),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
