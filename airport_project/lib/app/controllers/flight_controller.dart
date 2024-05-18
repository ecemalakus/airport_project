import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../ui/pages/flight_page/model/flight_model.dart';

class FlightController extends GetxController {
  var flightInfoList = <FlightInfo>[].obs;
  var isLoading = true.obs;

  Future<void> getFlightInfo() async {
    var dio = Dio();
    var apiKey = 'b9e4ef0f3ae5f95e27590359713e0336';
    var url =
        'http://api.aviationstack.com/v1/flights?access_key=$apiKey&dep_iata=ESB';

    try {
      isLoading.value = true;
      var response = await dio.get(url);
      print('API Response: ${response.data}');
      var flights = response.data['data'] as List;
      flightInfoList.value =
          flights.map((flight) => FlightInfo.fromJson(flight)).toList();
    } catch (error) {
      print('Error occurred: $error');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getFlightInfo();
    super.onInit();
  }
}

class FlightInfo {
  String? time;
  String? date;
  String? iata;
  String? origin;
  String? flightNumber;
  String? airline;
  String? status;

  FlightInfo({
    this.time,
    this.date,
    this.iata,
    this.origin,
    this.flightNumber,
    this.airline,
    this.status,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    var departure = json['departure'];
    var flight = json['flight'];
    var airline = json['airline'];

    return FlightInfo(
      time: _formatTime(departure['estimated'] ?? departure['scheduled']),
      date: _formatDate(departure['scheduled']),
      iata: departure['iata'],
      origin: departure['airport'],
      flightNumber: flight['iata'],
      airline: airline['name'],
      status: json['flight_status'],
    );
  }

  static String _formatTime(String? time) {
    if (time == null) return '';
    var dateTime = DateTime.parse(time);
    return DateFormat('HH:mm').format(dateTime);
  }

  static String _formatDate(String? date) {
    if (date == null) return '';
    var dateTime = DateTime.parse(date);
    return DateFormat('dd MMM').format(dateTime);
  }
}
