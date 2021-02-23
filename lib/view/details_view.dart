import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotykids/core/view_model/cart_view_model.dart';
import 'package:kotykids/model/cart_product_model.dart';
import 'package:kotykids/model/product_model.dart';
import 'package:kotykids/view/widgets/Button.dart';
import 'package:kotykids/view/widgets/Txt.dart';

import '../consts.dart';

class DetailsView extends StatelessWidget {
  @override
  ProductModel model;
  ScrollController scroll;
  DetailsView({this.model});

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Txt(
                        title: model.name,
                        size: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Txt(
                                  title: 'Size',
                                ),
                                Txt(
                                  title: model.size,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Txt(
                                  title: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Txt(
                        title: 'Details',
                        size: 22,
                      ),
                      SizedBox(
                        height: 00,
                      ),
                      Txt(
                        title: model.description,
                        size: 18,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Txt(
                          title: "PRICE ",
                          size: 22,
                          color: Colors.grey,
                        ),
                        Txt(
                          title: model.price + "EGP",
                          color: primaryColor,
                          size: 18,
                        )
                      ],
                    ),
                    GetBuilder<CartViewModel>(
                      init: CartViewModel(),
                      builder: (controller) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: Get.width / 2,
                        height: Get.height / 12,
                        child: Button(
                          onPressed: controller.addProduct(CartProductModel(
                            name: model.name,
                            image: model.image,
                            price: model.price,
                            quantity: 1,
                          )),
                          title: 'Add',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
