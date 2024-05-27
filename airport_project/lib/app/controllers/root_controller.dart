import 'package:airport_project/app/ui/pages/flight_page/flight_page.dart';
import 'package:airport_project/app/ui/pages/home_page/home_page.dart';
import 'package:airport_project/app/ui/pages/map_page/map_page.dart';
import 'package:airport_project/app/ui/pages/shopping_page/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../ui/pages/wallet_page/wallet_page.dart';
import 'profiledetail_controller.dart';

class RootController extends GetxController {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get controller => _controller;

  List<Widget> buildScreens = const [
    HomePage(),
    ShoppingPage(),
    FlightPage(),
    WalletPage(),
    MapPage(),
  ];

  @override
  void onInit() {
    ProfileDetailController prof = Get.put(ProfileDetailController());
    prof.getUserInfo();
    super.onInit();
  }
}
