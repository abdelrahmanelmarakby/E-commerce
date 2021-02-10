import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/view_model/control_view_model.dart';
import 'package:kotykids/core/view_model/home_view_model.dart';
import 'package:kotykids/view/widgets/CategoryItem.dart';
import 'package:kotykids/view/widgets/Txt.dart';

class HomeView extends GetWidget<ControlViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 16, right: 16),
          child: ListView(
            children: [
              SizedBox(
                height: Get.height / 35,
              ),
              _buildSearchBar(),
              SizedBox(
                height: 20,
              ),
              Txt(
                title: "Categories",
                size: 22,
              ),
              SizedBox(
                height: 10,
              ),
              _buildCategoryListView(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    title: "Best Selling",
                  ),
                  Txt(
                    title: "See all",
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _buildBestSelling()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBestSelling() {
    return Container(
        height: Get.height / 2,
        child: FadeInLeft(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    // color: Colors.grey,
                    height: Get.height,
                    width: Get.width / 2.2,
                    child: Column(
                      children: [
                        Image.asset("assets/009-shirt.png"),
                        Txt(
                          size: 18,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Txt(
                          size: 14,
                          color: Colors.black54,
                        ),
                        Txt(
                          color: primaryColor,
                          title: "\$57.0",
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            hintText: "Search..."),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return Container(
      height: Get.height / 6,
      child: FadeInLeft(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CategoryItem(
              title: "men",
              ImageSrc: "assets/009-shirt.png",
            ),
            CategoryItem(
              title: "Women",
              ImageSrc: "assets/008-dress.png",
            ),
            CategoryItem(
              title: "Accessories",
              ImageSrc: "assets/007-diamond-ring.png",
            ),
            CategoryItem(
              title: "Gadgets",
              ImageSrc: "assets/006-handbag.png",
            ),
          ],
        ),
      ),
    );
  }
}
