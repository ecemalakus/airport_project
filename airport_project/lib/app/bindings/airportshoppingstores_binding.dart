
import 'package:get/get.dart';
import '../controllers/airportshoppingstores_controller.dart';


class AirportShoppingStoresBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirportShoppingStoresController>(() => AirportShoppingStoresController());
  }
}