
import 'package:get/get.dart';
import '../controllers/flight_controller.dart';


class FlightBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightController>(() => FlightController());
  }
}