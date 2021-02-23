import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kotykids/core/services/cart_database.dart';
import 'package:kotykids/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProducts();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }

  getAllProducts() async {
    _loading.value = true;

    var dbHelper = CartDataBaseHelper.db;

    _cartProductModel = await dbHelper.getAllProducts();

    _loading.value = false;

    print(_cartProductModel.length);
    update();
  }
}
