import 'package:flutter/material.dart';

class WrapperProvider with ChangeNotifier {
  WrapperProvider() {
    _init();
  }

  void _init() {}

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  set pageController(PageController value) {
    _pageController = value;
    notifyListeners();
  }
}
