import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/flight_controller.dart';

class FlightPage extends GetView<FlightController> {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightController>(
        init: FlightController(),
        initState: (state) {},
        builder: (c) {
          return Scaffold(
            backgroundColor: ColorManager.instance.blue,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: Utility.dynamicWidthPixel(6), top: Utility.dynamicWidthPixel(20), right: Utility.dynamicWidthPixel(6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Havalimanı Uçuş Bilgileri",
                          style: TextStyle(
                            fontFamily: "Medium",
                            fontSize: Utility.dynamicTextSize(18),
                          ),
                        ),
                        SizedBox(
                          width: Utility.dynamicWidthPixel(8),
                        ),
                        Icon(
                          Icons.flight,
                          size: Utility.dynamicWidthPixel(25),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(10)),
                        child: Scrollbar(
                          thickness: 0.9,
                          radius: Radius.circular(Utility.dynamicWidthPixel(10)),
                          child: SingleChildScrollView(
                            child: (c.flightInfo != null || c.flightInfo?.data != null)
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: ColorManager.instance.black),
                                    ),
                                    child: Center(
                                      child: DataTable(
                                        columns: [
                                          DataColumn(
                                            label: Text(
                                              'Kalkış',
                                              style: TextStyle(
                                                fontFamily: "Medium",
                                                fontSize: Utility.dynamicTextSize(13),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Varış',
                                              style: TextStyle(
                                                fontFamily: "Medium",
                                                fontSize: Utility.dynamicTextSize(13),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Tarih',
                                              style: TextStyle(
                                                fontFamily: "Medium",
                                                fontSize: Utility.dynamicTextSize(13),
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: c.flightInfo!.data!.map((flightInfo) {
                                          return DataRow(cells: [
                                            DataCell(
                                              Text(
                                                flightInfo.origin ?? "",
                                                style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize: Utility.dynamicTextSize(13),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                flightInfo.destination ?? "",
                                                style: TextStyle(fontFamily: "Medium", fontSize: Utility.dynamicTextSize(13)),
                                              ),
                                            ),
                                            DataCell(Text(DateFormat('dd-MM-yyyy').format(flightInfo.departureDate!), style: TextStyle(fontFamily: "Medium", fontSize: Utility.dynamicTextSize(13)))),
                                          ]);
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: Utility.dynamicWidthPixel(200),
                                    width: Get.width,
                                    child: Text(
                                      "Bilgilere Ulaşılamadı",
                                      style: TextStyle(
                                        fontFamily: "Medium",
                                        fontSize: Utility.dynamicTextSize(13),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
