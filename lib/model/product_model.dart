import 'package:flutter/cupertino.dart';
import 'package:kotykids/core/Util/color_extention.dart';

class ProductModel {
  String name;
  String image;
  String description;
  Color color;
  String size;
  String price;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor.fromHex(json['color']);
    size = json['size'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    return data;
  }
}
