import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CartProductModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String price;
  @HiveField(3)
  int quantity;

  CartProductModel({this.name, this.image, this.price, this.quantity});
}
