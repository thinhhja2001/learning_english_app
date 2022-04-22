import 'package:flutter/material.dart';
import 'package:learning_english_app/utils/colors.dart';

class SearchFavorite extends StatefulWidget {
  const SearchFavorite({Key? key}) : super(key: key);

  @override
  State<SearchFavorite> createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      
      child: Container(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            focusColor: kPrimaryColor,
            hintText: 'Search by note or question name',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
