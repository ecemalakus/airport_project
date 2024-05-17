import 'package:airport_project/app/controllers/login_controller.dart';
import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';
import '../../../../core/init/theme/color_manager.dart';
import '../../../controllers/forgotpassword_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.blue,
      appBar: AppBar(
        backgroundColor: ColorManager.instance.blue,
      ),
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (login) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "E-posta hesabınızı girerek, şifrenizi sıfırlayabilirsiniz",
                      style: TextStyle(fontSize: Utility.dynamicTextSize(18), fontFamily: "Medium"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Utility.dynamicWidthPixel(24)),
                      child: TextFormFieldApp.instance.widget(
                        context: context,
                        labelText: "E-posta",
                        keyboardType: TextInputType.emailAddress,
                        controller: login.resetPasswordController,
                        errorStyle: TextStyle(color: ColorManager.instance.red),
                        leadingIcon: Icon(
                          Icons.mail,
                          color: ColorManager.instance.darkGray.withOpacity(0.6),
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
                      color: ColorManager.instance.black,
                      onTap: () async {
                        try {
                          FirebaseAuth.instance.sendPasswordResetEmail(email: login.resetPasswordController.text.trim());
                          Get.closeAllSnackbars();
                          Get.snackbar("Başarılı", "Sıfırlama İsteği Gönderildi");
                        } on FirebaseAuthException catch (e) {
                          Get.closeAllSnackbars();
                          final translator = GoogleTranslator();
                          Translation translation = await translator.translate(e.message ?? "", to: 'tr');
                          Get.snackbar("Error", translation.text, backgroundColor: Colors.white);
                        }
                      },
                      title: "ŞİFREMİ SIFIRLA",
                      textColor: ColorManager.instance.white,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
