import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = false;

  updateLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
