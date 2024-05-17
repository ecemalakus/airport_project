
import 'package:get/get.dart';
import '../controllers/deleteaccount_controller.dart';


class DeleteAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountController>(() => DeleteAccountController());
  }
}