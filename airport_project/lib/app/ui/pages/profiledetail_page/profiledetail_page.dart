import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profiledetail_controller.dart';

class ProfileDetailPage extends GetView<ProfileDetailController> {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.white,
      appBar: AppBar(
        backgroundColor: ColorManager.instance.yellow,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: GetBuilder<ProfileDetailController>(
              init: ProfileDetailController(),
              builder: (c) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: TextFormFieldApp.instance.widget(
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                            12,
                            4,
                            4,
                            6,
                          ),
                          focusColor: ColorManager.instance.greyBG,
                          fillColor: ColorManager.instance.greyBG,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: ColorManager.instance.yellow, //
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color:
                                ColorManager.instance.darkGray.withOpacity(0.6),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorManager.instance.darkGray),
                        context: context,
                        controller: c.usernameController
                          ..text = c.userSnapshot?.data()?["username"] ?? "",
                        labelText: "Kullanıcı Adı",
                        maxLines: 1,
                        readOnly: true,
                        enabled: false,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Lütfen bu alanı doldurunuz.";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 30),
                      child: TextFormFieldApp.instance.widget(
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                            12,
                            4,
                            4,
                            6,
                          ),
                          focusColor: ColorManager.instance.greyBG,
                          fillColor: ColorManager.instance.greyBG,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: ColorManager.instance.greyBG,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: ColorManager.instance.yellow, //
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color:
                                ColorManager.instance.darkGray.withOpacity(0.6),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorManager.instance.darkGray),
                        context: context,
                        controller: c.emailContoller
                          ..text = c.userSnapshot?.data()?["email"] ?? "",
                        labelText: "E-Posta",
                        maxLines: 1,
                        readOnly: true,
                        enabled: false,
                        validation: (val) {
                          if (val!.isEmpty) {
                            return "Lütfen bu alanı doldurunuz.";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Utility.dynamicWidthPixel(30)),
                      child: Button(
                        color: ColorManager.instance.yellow,
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        title: "Çıkış Yap",
                        textColor: ColorManager.instance.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
