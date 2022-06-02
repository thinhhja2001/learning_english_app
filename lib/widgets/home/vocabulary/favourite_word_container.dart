// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/models/vocabulary/favorite_vocabulary.dart';
import '../../../screens/vocabulary/favorite_word_list_screen.dart';
import '../../../utils/styles.dart';

class FavouriteWordContainer extends StatefulWidget {
  const FavouriteWordContainer({Key? key}) : super(key: key);

  @override
  State<FavouriteWordContainer> createState() => _FavouriteWordContainerState();
}

class _FavouriteWordContainerState extends State<FavouriteWordContainer> {
  List<FavoriteWord> listFavorite = [];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double pointWidth = screenSize.width * 0.4 * 0.67;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.to(FavoriteWordListScreen());
        },
        child: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54])
                    .createShader(
                        Rect.fromLTRB(0, -140, rect.width, rect.height * 0.8));
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/favorite_vocabulary.jpg"),
                        fit: BoxFit.fill),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "Danh sách yêu thích",
                style: ktsWhiteTitle.copyWith(fontSize: 30),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
