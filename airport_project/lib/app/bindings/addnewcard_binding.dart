
import 'package:get/get.dart';
import '../controllers/addnewcard_controller.dart';


class AddNewCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewCardController>(() => AddNewCardController());
  }
}