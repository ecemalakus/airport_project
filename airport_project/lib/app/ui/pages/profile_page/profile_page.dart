import 'package:airport_project/app/ui/pages/discover_page/discover_page.dart';
import 'package:airport_project/app/ui/pages/forgotpassword_page/forgotpassword_page.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../core/base/base_state.dart';
import '../../../controllers/profile_controller.dart';
import '../deleteaccount_page/deleteaccount_page.dart';
import '../profiledetail_page/profiledetail_page.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (prof) {
          return Scaffold(
            backgroundColor: ColorManager.instance.yellow,
            appBar: AppBar(
              backgroundColor: ColorManager.instance.yellow,
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Utility.dynamicWidthPixel(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: Utility.dynamicWidthPixel(16)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "AYARLAR",
                          style: TextStyle(
                              fontSize: Utility.dynamicTextSize(32),
                              fontFamily: "Medium"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utility.dynamicWidthPixel(30),
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: const ProfileDetailPage(),
                            withNavBar: true);
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                        decoration: BoxDecoration(
                          color: ColorManager.instance.white,
                          border: Border.all(
                            color: ColorManager.instance.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hesap Bilgileri",
                              style: TextStyle(
                                  fontSize: Utility.dynamicTextSize(19),
                                  fontFamily: "Medium"),
                            ),
                            SizedBox(
                              width: Utility.dynamicWidthPixel(16),
                            ),
                            Icon(
                              Icons.account_box,
                              size: Utility.dynamicWidthPixel(35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utility.dynamicWidthPixel(30),
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: const ForgotPasswordPage(),
                            withNavBar: true);
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                        decoration: BoxDecoration(
                          color: ColorManager.instance.white,
                          border: Border.all(
                            color: ColorManager.instance.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Profil Ayarları",
                              style: TextStyle(
                                  fontSize: Utility.dynamicTextSize(19),
                                  fontFamily: "Medium"),
                            ),
                            SizedBox(
                              width: Utility.dynamicWidthPixel(16),
                            ),
                            Icon(
                              Icons.delete,
                              size: Utility.dynamicWidthPixel(35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utility.dynamicWidthPixel(30),
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: const DeleteAccountPage(),
                            withNavBar: true);
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                        decoration: BoxDecoration(
                          color: ColorManager.instance.white,
                          border: Border.all(
                            color: ColorManager.instance.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hesabı Sil",
                              style: TextStyle(
                                  fontSize: Utility.dynamicTextSize(19),
                                  fontFamily: "Medium"),
                            ),
                            SizedBox(
                              width: Utility.dynamicWidthPixel(16),
                            ),
                            Icon(
                              Icons.lock,
                              size: Utility.dynamicWidthPixel(35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Utility.dynamicWidthPixel(30),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: const DiscoverInfoPage(),
                                withNavBar: true);
                          },
                          child: Icon(
                            Icons.info_outline,
                            size: Utility.dynamicWidthPixel(35),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
