// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/screens/favorite_screen.dart';
import 'package:learning_english_app/screens/menu/menu_screen.dart';
import 'package:learning_english_app/screens/statistic/statistics_screen.dart';
import 'package:learning_english_app/utils/colors.dart';
import 'package:learning_english_app/screens/practice/practice_screen.dart';
import 'package:learning_english_app/widgets/home/vocabulary/vocabulary_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  ///Thay widget cua minh vao day
  List<Widget> _widgetOptions = [
    PracticeScreen(),
    VocabularyGeneral(),
    StatisticsScreen(),
    FavoriteScreen(),
    MenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color:
                    _currentIndex == 0 ? kPrimaryColor : kUnselectedIconColor,
              ),
              label: "Practice"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
                color:
                    _currentIndex == 1 ? kPrimaryColor : kUnselectedIconColor,
              ),
              label: "Vocabulary"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pie_chart,
                color:
                    _currentIndex == 2 ? kPrimaryColor : kUnselectedIconColor,
              ),
              label: "Statistics"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color:
                    _currentIndex == 3 ? kPrimaryColor : kUnselectedIconColor,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dehaze,
                color:
                    _currentIndex == 4 ? kPrimaryColor : kUnselectedIconColor,
              ),
              label: "Menu")
        ],
        fixedColor: kPrimaryColor,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
