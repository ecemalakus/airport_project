import 'package:airport_project/app/controllers/flight_controller.dart';
import 'package:airport_project/app/ui/pages/airportshoppingstores_page/airportshoppingstores_page.dart';
import 'package:airport_project/app/ui/pages/asistant_page/asistant_page.dart';
import 'package:airport_project/app/ui/pages/mytickets_page/mytickets_page.dart';
import 'package:airport_project/app/ui/pages/profile_page/profile_page.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../controllers/home_controller.dart';
import '../services_page/services_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightController>(
      init: FlightController(),
      builder: (fl) {
        return GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) {
            return Scaffold(
              backgroundColor: ColorManager.instance.white,
              appBar: AppBar(
                backgroundColor: ColorManager.instance.yellow,
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: SizedBox(
            width: 80, // Genişlik
            height: 80, // Yükseklik
            child: FittedBox(
              fit: BoxFit.contain,
                    child: Image.asset(
                      'assets/images/Skybee_logo_transparent.png', // Logonun genişliği
                    ), // Logo dosyanızın yolu
                  ),
                ),
                 ),
                actions: [
                  InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: const ProfilePage(), withNavBar: true);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: Utility.dynamicWidthPixel(12)),
                      child: Icon(
                        Icons.account_circle,
                        color: ColorManager.instance.black,
                        size: Utility.dynamicWidthPixel(45),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Utility.dynamicWidthPixel(100),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: const ServicesPage(), withNavBar: true);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(
                                  0.2), // Set gray background color
                              border: Border.all(
                                color: ColorManager.instance.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hizmetler",
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: Utility.dynamicTextSize(17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Utility.dynamicWidthPixel(5),
                        ),
                        InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: const AirportShoppingStoresPage(),
                                withNavBar: true);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(
                                  0.2), // Set gray background color
                              border: Border.all(
                                color: ColorManager.instance.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Alışveriş",
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: Utility.dynamicTextSize(17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Utility.dynamicWidthPixel(5),
                        ),
                        InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: const AsistantPage(), withNavBar: true);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(
                                  0.2), // Set gray background color
                              border: Border.all(
                                color: ColorManager.instance.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Asistan",
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: Utility.dynamicTextSize(17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Utility.dynamicWidthPixel(24),
                        horizontal: Utility.dynamicWidthPixel(16)),
                    child: InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: const MyTicketsPage(), withNavBar: true);
                      },
                      child: Container(
                        padding: EdgeInsets.all(Utility.dynamicWidthPixel(8)),
                        decoration: BoxDecoration(
                          color: ColorManager.instance.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(Utility.dynamicWidthPixel(8)),
                          decoration: BoxDecoration(
                            color: ColorManager.instance.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "BİLETLERİM",
                                  style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: Utility.dynamicTextSize(17)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Utility.dynamicWidthPixel(8)),
                                  child: const Icon(Icons.airplane_ticket),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Utility.dynamicWidthPixel(30),
                      horizontal: Utility.dynamicWidthPixel(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.instance.black),
                            color: ColorManager.instance.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Yolculuklarınızın Anahtarı Cebinizde!",
                              style: TextStyle(
                                fontFamily: "Medium",
                                fontSize: Utility.dynamicTextSize(14),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Utility.dynamicWidthPixel(20)),
                          child: Container(
                            padding:
                                EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorManager.instance.black),
                              color: ColorManager.instance.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Anlık Bilgiler, Anında Erişim",
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: Utility.dynamicTextSize(14),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.instance.black),
                            color: ColorManager.instance.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Skybee kullanıcıları için özel indirimler! Havalimanı mağazalarında avantajlı alışveriş fırsatlarını kaçırmayın",
                              style: TextStyle(
                                fontFamily: "Medium",
                                fontSize: Utility.dynamicTextSize(14),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
