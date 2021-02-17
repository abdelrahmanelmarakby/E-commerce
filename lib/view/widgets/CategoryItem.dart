import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Txt.dart';

class CategoryItem extends StatelessWidget {
  final String ImageSrc;
  final String title;
  const CategoryItem({
    Key key,
    this.ImageSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade50,
            child: Image.network(
              ImageSrc,
              height: Get.height / 20,
              color: Colors.black,
            ),
            radius: Get.height / 20,
          ),
          Txt(
            title: title,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
