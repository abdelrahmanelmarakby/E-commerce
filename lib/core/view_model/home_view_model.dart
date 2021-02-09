import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/view/cart_view.dart';
import 'package:kotykids/view/home_view.dart';
import 'package:kotykids/view/profile_view.dart';

class HomeViewModel extends GetxController {
  Widget _currentScreen = HomeView();

  get CurrentScreen => _currentScreen;

  int _navIndex = 0;
  get navIndex => _navIndex;
  onSelected(int index) {
    _navIndex = index;
    switch (navIndex) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
        {
          _currentScreen = CartView();
          break;
        }
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    print(CurrentScreen);
    update();
  }
}
