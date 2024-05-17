
import 'package:get/get.dart';
import '../controllers/mytickets_controller.dart';


class MyTicketsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTicketsController>(() => MyTicketsController());
  }
}