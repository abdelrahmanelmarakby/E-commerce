import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/view_model/auth_view_model.dart';
import 'package:kotykids/core/view_model/home_view_model.dart';

import 'auth/loginScreen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null
          ? loginScreen()
          : GetBuilder<HomeViewModel>(
              builder: (controller) => Scaffold(
                body: controller.CurrentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            ));
    });
  }

  _bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => FlashyTabBar(
          showElevation: true,
          animationDuration: Duration(milliseconds: 250),
          backgroundColor: Colors.green.shade50,
          selectedIndex: controller.navIndex,
          items: [
            FlashyTabBarItem(
                inactiveColor: primaryColor,
                activeColor: Colors.black,
                icon: Icon(
                  Icons.explore_outlined,
                  //  color: Colors.green,
                ),
                title: Text(
                  "explore",
                )),
            FlashyTabBarItem(
                inactiveColor: primaryColor,
                activeColor: Colors.black,
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  //color: Colors.green,
                ),
                title: Text("cart")),
            FlashyTabBarItem(
                inactiveColor: primaryColor,
                activeColor: Colors.black,
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                title: Text("profile")),
          ],
          onItemSelected: (index) {
            controller.onSelected(index);
          }),
    );
  }
}
