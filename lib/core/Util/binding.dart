import 'package:get/get.dart';
import 'package:kotykids/core/view_model/auth_view_model.dart';
import 'package:kotykids/core/view_model/cart_view_model.dart';
import 'package:kotykids/core/view_model/control_view_model.dart';
import 'package:kotykids/core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
