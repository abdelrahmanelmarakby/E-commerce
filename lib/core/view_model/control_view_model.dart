import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/view/cart_view.dart';
import 'package:kotykids/view/home_view.dart';
import 'package:kotykids/view/profile_view.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();

  get CurrentScreen => _currentScreen;

  int _navIndex = 0;
  get navIndex => _navIndex;
  onSelected(int index) {
    _navIndex = index;
    switch (index) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
