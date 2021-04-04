class CartProductModel {
  String name;
  String image;
  String price;
  int quantity;

  CartProductModel({this.name, this.image, this.price, this.quantity});

  CartProductModel.fromJson(
    Map<dynamic, dynamic> json,
  ) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
