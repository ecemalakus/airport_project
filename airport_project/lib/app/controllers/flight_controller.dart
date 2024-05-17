import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../ui/pages/flight_page/model/flight_model.dart';

class FlightController extends GetxController {
  AirportModel? flightInfo;
  Future<void> getAirportInfo() async {
    var dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer vITj8A1b49GQstwgCXSXMXGJsdAJ';
    try {
      var response = await dio.get(
          'https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=PAR&maxPrice=500');
      flightInfo = AirportModel.fromJson(response.data);
      update();
    } catch (error) {
      print('İstek sırasında bir hata oluştu: $error');
    }
  }

  @override
  void onInit() {
    getAirportInfo();
    super.onInit();
  }

  /* List<FlightInfo> flightInfos = [
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'PAR',
      status: 'Open',
      gateNumber: 'A1',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'LON',
      status: 'Closed',
      gateNumber: 'B2',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'NYC',
      status: 'Opening',
      gateNumber: 'C3',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'IST',
      status: 'Open',
      gateNumber: 'D4',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'BER',
      status: 'Opening',
      gateNumber: 'E5',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'MAD',
      status: 'Closed',
      gateNumber: 'F6',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'DXB',
      status: 'Open',
      gateNumber: 'G7',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'SYD',
      status: 'Closed',
      gateNumber: 'H8',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'AMS',
      status: 'Son',
      gateNumber: 'I9',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'ROM',
      status: 'Open',
      gateNumber: 'J10',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'MUC',
      status: 'Closed',
      gateNumber: 'K11',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'CDG',
      status: 'Open',
      gateNumber: 'L12',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'BCN',
      status: 'Opening',
      gateNumber: 'M13',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'HKG',
      status: 'Open',
      gateNumber: 'N14',
    ),
    FlightInfo(
      departureAirport: 'ANK',
      arrivalAirport: 'SIN',
      status: 'Closed',
      gateNumber: 'O15',
    ),
  ]; */
}
