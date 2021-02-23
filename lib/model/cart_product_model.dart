class CartProductModel {
  String name;
  String image;
  String price;
  int quantity;

  CartProductModel({this.name, this.image, this.price, this.quantity});

  CartProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json[quantity];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
