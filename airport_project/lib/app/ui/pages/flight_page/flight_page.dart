import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/flight_controller.dart';

class FlightPage extends GetView<FlightController> {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightController>(
      init: FlightController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Havalimanı Uçuş Bilgileri'),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  controller.getFlightInfo(); // Call to refresh flight info
                },
              ),
            ],
          ),
          body: controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Time')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('IATA')),
                        DataColumn(label: Text('Origin')),
                        DataColumn(label: Text('Flight')),
                        DataColumn(label: Text('Airline')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: controller.flightInfoList.map((flight) {
                        return DataRow(cells: [
                          DataCell(Text(flight.time ?? '')),
                          DataCell(Text(flight.date ?? '')),
                          DataCell(Text(flight.iata ?? '')),
                          DataCell(Text(flight.origin ?? '')),
                          DataCell(Text(flight.flightNumber ?? '')),
                          DataCell(Text(flight.airline ?? '')),
                          DataCell(Text(flight.status ?? '')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
