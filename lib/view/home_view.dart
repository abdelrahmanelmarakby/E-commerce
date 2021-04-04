import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/core/view_model/control_view_model.dart';
import 'package:kotykids/core/view_model/home_view_model.dart';
import 'package:kotykids/view/widgets/Txt.dart';

import 'details_view.dart';

class HomeView extends GetWidget<ControlViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 16, right: 16),
                  child: Column(
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
                      _listViewCategory(),
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
                        height: 12,
                      ),
                      _listViewProducts()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.green.shade50,
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width * .5,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100,
                            ),
                            child: Container(
                                height: 220,
                                width: MediaQuery.of(context).size.width * .4,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Txt(
                            title: controller.productModel[index].name,
                            align: Alignment.bottomLeft,
                            bold: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /*
                          Expanded(
                            child: Txt(
                              title: controller.productModel[index].description,
                              color: Colors.grey,
                              align: Alignment.bottomLeft,
                            ),
                          ),*/
                          Txt(
                            title: controller.productModel[index].price
                                    .toString() +
                                " EGP",
                            color: primaryColor,
                            align: Alignment.bottomRight,
                            size: 22,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
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

Widget _listViewCategory() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => Container(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green.shade50,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(controller.categoryModel[index].image),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Txt(
                title: controller.categoryModel[index].name,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    ),
  );
}
