import 'package:get/get.dart';
import '../controllers/asistant_controller.dart';

class AsistantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsistantController>(() => AsistantController());
  }
}
