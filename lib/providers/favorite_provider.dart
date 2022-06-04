import 'package:flutter/material.dart';
import 'package:learning_english_app/resources/firebase_handle.dart';

import '../models/favorite.dart';

class FavoriteProvider with ChangeNotifier {
  var _indexClicked = [true, false, false, false, false, false, false, false];

  List<String> _listTitle = List.empty(growable: true);
  List<Favorite> _currentPart = List.empty(growable: true);

  // ignore: prefer_final_fields
  List<List<Favorite>> _listParts = List.empty(growable: true);

  List<Favorite> _favorites = [];

  int _partIndex = 0;

  bool _loading = false;

  bool get loading => _loading;

  get favorites => _favorites;

  get listTitle => _listTitle;

  int get partIndex => _partIndex;

  get indexClicked => _indexClicked;

  bool checkAllIndex() {
    if (_indexClicked[1] == true &&
        _indexClicked[2] == true &&
        _indexClicked[3] == true &&
        _indexClicked[4] == true &&
        _indexClicked[5] == true &&
        _indexClicked[6] == true &&
        _indexClicked[7] == true) {
      return true;
    }
    return false;
  }

  Future<void> getAllFavoriteData() async {
    _loading = true;
    notifyListeners();
    await FirebaseHandler.getListFavoriteTest().then((value) {
      _loading = false;
      _favorites = value;
      _currentPart = value;

      for (int i = 0; i < value.length; i++) {
        if (!_listTitle.contains(value[i].title)) {
          _listTitle.add(value[i].title!);
        }
      }

      getListPart();
      notifyListeners();
    });
  }

  Future<bool> checkResult(String part,String test,int index) async
  {
    
    return true;
  }

  void getListPart() {
    _listParts
        .add(_favorites.where((element) => element.part == "part1").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part2").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part3").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part4").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part5").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part6").toList());
    _listParts
        .add(_favorites.where((element) => element.part == "part7").toList());
  }

  void partClicked(int index) {
    _partIndex = index;
    if(_indexClicked[0] == true && index != 0)
    {
      _currentPart = [];
    }
    switch (index) {
      case 0:
        _currentPart = _favorites;
        _indexClicked = [true, false, false, false, false, false, false, false];
        break;
      default:
        {
          _indexClicked[index] = !_indexClicked[index];
          if (!_indexClicked.contains(true) || checkAllIndex()) {
            _indexClicked = [
              true,
              false,
              false,
              false,
              false,
              false,
              false,
              false
            ];
            _currentPart = _favorites;
          } else {
            _indexClicked[0] = false;
            _listTitle = [];
            if (_listParts[index - 1].isNotEmpty) {
              if (_indexClicked[index] == true) {
                _currentPart.addAll(_listParts[index - 1]);
              } else {
                _currentPart
                    .removeWhere((element) => element.part == "part$index");
              }
            }
          }
          break;
        }
    }
    _currentPart.sort(((a, b) => a.part!.compareTo(b.part!)));
    for (int i = 0; i < _currentPart.length; i++) {
      if (!_listTitle.contains(_currentPart[i].title)) {
        _listTitle.add(_currentPart[i].title!);
      }
    }
    
    notifyListeners();
  }

  void getFavoritesData() {}
}
