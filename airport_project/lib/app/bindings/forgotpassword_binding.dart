
import 'package:get/get.dart';
import '../controllers/forgotpassword_controller.dart';


class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}