
import 'package:get/get.dart';
import '../controllers/shopping_controller.dart';


class ShoppingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(() => ShoppingController());
  }
}