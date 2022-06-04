import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/favorite_provider.dart';
import '../../../utils/colors.dart';

class FavoriteParts extends StatefulWidget {
  final String title;
  final int index;
  const FavoriteParts(
      {Key? key,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  State<FavoriteParts> createState() => _FavoritePartsState();
}

class _FavoritePartsState extends State<FavoriteParts> {
  IconData? iconPart;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    Color colorPart = favoriteProvider.indexClicked[widget.index] ? kPrimaryColor : kcSecondBackgroundButton;
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
          favoriteProvider.partClicked(widget.index);
        },
      ),
    );
  }
}
