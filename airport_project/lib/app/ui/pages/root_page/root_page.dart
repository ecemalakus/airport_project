import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../controllers/root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    RootController c = Get.put(RootController());
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: c.controller,
        screens: c.buildScreens,
        backgroundColor: ColorManager.instance.black,
        navBarHeight: 65,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Anasayfa",
            textStyle: TextStyle(
              color: ColorManager.instance.yellow,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            activeColorPrimary: ColorManager.instance.yellow,
            inactiveColorPrimary: Colors.yellow,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.map_outlined),
            textStyle: TextStyle(
              color: ColorManager.instance.yellow,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            title: "Keşfet",
            activeColorPrimary: ColorManager.instance.yellow,
            inactiveColorPrimary: Colors.yellow,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.flight),
            textStyle: TextStyle(
              color: ColorManager.instance.yellow,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            title: "Uçuşlar",
            activeColorPrimary: ColorManager.instance.yellow,
            inactiveColorPrimary: Colors.yellow,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.wallet),
            textStyle: TextStyle(
              color: ColorManager.instance.yellow,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            title: "Cüzdan",
            activeColorPrimary: ColorManager.instance.yellow,
            inactiveColorPrimary: Colors.yellow,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.location_on),
            textStyle: TextStyle(
              color: ColorManager.instance.yellow,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            title: "Harita",
            activeColorPrimary: ColorManager.instance.yellow,
            inactiveColorPrimary: Colors.yellow,
          ),
        ],
        confineInSafeArea: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.yellow,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
