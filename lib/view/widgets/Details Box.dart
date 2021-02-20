import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Txt.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({
    Key key,
    this.Title,
    this.description,
  }) : super(key: key);

  final String Title;
  final Widget description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2.2,
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Txt(
                      title: Title,
                    ),
                    description
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
