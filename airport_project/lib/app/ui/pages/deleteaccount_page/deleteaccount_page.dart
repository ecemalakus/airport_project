import 'package:airport_project/app/ui/global_widgets/custom_dialog.dart';
import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/init/theme/color_manager.dart';
import '../../../controllers/deleteaccount_controller.dart';
import '../../global_widgets/button.dart';

class DeleteAccountPage extends GetView<DeleteAccountController> {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.white,
      appBar: AppBar(
        backgroundColor: ColorManager.instance.yellow,
      ),
      body: GetBuilder<DeleteAccountController>(
          init: DeleteAccountController(),
          builder: (c) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                child: Form(
                  key: c.key,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bilgilerinizi Girerek Hesabınızı Silebilirsiniz",
                          style: TextStyle(
                              fontSize: Utility.dynamicTextSize(18),
                              fontFamily: "Medium"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Utility.dynamicWidthPixel(12)),
                          child: TextFormFieldApp.instance.widget(
                            context: context,
                            labelText: "E-posta",
                            keyboardType: TextInputType.emailAddress,
                            controller: c.emailController,
                            errorStyle:
                                TextStyle(color: ColorManager.instance.red),
                            leadingIcon: Icon(
                              Icons.mail,
                              color: ColorManager.instance.darkGray
                                  .withOpacity(0.6),
                            ),
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Lütfen bu alanı doldurunuz.";
                              }
                              if (val.length < 6) {
                                return "Lütfen en az 6 karakter giriniz.";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Utility.dynamicWidthPixel(12)),
                          child: TextFormFieldApp.instance.widget(
                            context: context,
                            obscureText: true,
                            labelText: "Şifre",
                            keyboardType: TextInputType.visiblePassword,
                            controller: c.passController,
                            errorStyle:
                                TextStyle(color: ColorManager.instance.red),
                            leadingIcon: Icon(
                              Icons.lock,
                              color: ColorManager.instance.darkGray
                                  .withOpacity(0.6),
                            ),
                            validation: (val) {
                              if (val!.isEmpty) {
                                return "Lütfen bu alanı doldurunuz.";
                              }
                              if (val.length < 6) {
                                return "Lütfen en az 6 karakter giriniz.";
                              }
                              return null;
                            },
                          ),
                        ),
                        Button(
                          color: ColorManager.instance.yellow,
                          onTap: () async {
                            if (c.key.currentState!.validate()) {
                              AirportProject().showGeneralDialog(context,
                                  body: Column(
                                    children: [
                                      Text(
                                        "Hesabınızı silmek istediğinize emin misiniz ?",
                                        style: TextStyle(
                                            fontSize:
                                                Utility.dynamicTextSize(14),
                                            fontFamily: "Medium"),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Button(
                                            color: ColorManager.instance.white,
                                            borderColor:
                                                ColorManager.instance.black,
                                            onTap: () {
                                              Get.back();
                                            },
                                            textColor:
                                                ColorManager.instance.black,
                                            title: "Vazgeç",
                                          )),
                                          SizedBox(
                                            width:
                                                Utility.dynamicWidthPixel(12),
                                          ),
                                          Expanded(
                                              child: Button(
                                            color: ColorManager.instance.black,
                                            onTap: () async {
                                              c.deleteUserAccount(
                                                  email: c.emailController.text,
                                                  password:
                                                      c.passController.text);
                                            },
                                            title: "Evet",
                                            textColor:
                                                ColorManager.instance.white,
                                          ))
                                        ],
                                      )
                                    ],
                                  ));
                            }
                          },
                          title: "Hesabı Sil",
                          textColor: ColorManager.instance.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
