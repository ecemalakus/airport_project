
import 'package:get/get.dart';
import '../controllers/profiledetail_controller.dart';


class ProfileDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetailController>(() => ProfileDetailController());
  }
}