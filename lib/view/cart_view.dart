import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:kotykids/consts.dart';
import 'package:kotykids/view/widgets/Button.dart';
import 'package:kotykids/view/widgets/Txt.dart';

class CartView extends StatelessWidget {
  List<String> names = <String>[
    "First Product",
    "Second Product",
    "Third Product",
    "Fourth Product"
  ];
  List<String> images = <String>[
    "assets/Flogo.png",
    "assets/Flogo.png",
    "assets/Flogo.png",
    "assets/Flogo.png",
  ];
  List<int> prices = <int>[14322, 5191, 4999, 451351];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Slidable(
                      actionExtentRatio: .3,
                      actionPane: SlidableDrawerActionPane(),
                      child: Row(
                        children: [
                          Image.asset(images[index]),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  title: names[index],
                                  bold: true,
                                  size: 20,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Txt(
                                  title: prices[index].toString(),
                                  color: primaryColor,
                                  size: 18,
                                  align: Alignment.bottomLeft,
                                  bold: true,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.shade200),
                                  width: 120,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.add),
                                      Container(
                                        width: 1,
                                        height: 100,
                                        color: Colors.black12,
                                      ),
                                      Txt(
                                        title: "1",
                                        align: Alignment.center,
                                      ),
                                      Container(
                                        width: 1,
                                        height: 100,
                                        color: Colors.black12,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Icon(Icons.minimize),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      actions: <Widget>[
                        IconSlideAction(
                          foregroundColor: Colors.white,
                          caption: 'Add to favourites',
                          color: Colors.yellow.shade700,
                          icon: Icons.star,
                          onTap: () {},
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                          foregroundColor: Colors.white,
                          caption: 'Remove',
                          color: Colors.red.shade700,
                          icon: Icons.delete,
                          onTap: () {},
                        ),
                      ],
                    ),
                  );
                },
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
                        title: "TOTAL PRICE ",
                        size: 22,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Txt(
                        title: "1231231" + "EGP",
                        color: primaryColor,
                        size: 18,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: Get.width / 2,
                    height: Get.height / 12,
                    child: Button(
                      onPressed: () {},
                      title: 'CHECKOUT',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
