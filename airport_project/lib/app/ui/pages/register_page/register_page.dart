import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/register_controller.dart';
import '../root_page/root_page.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (c) {
          return Scaffold(
            backgroundColor: ColorManager.instance.blue,
            body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final isSignedIn = snapshot.data != null;
                if (isSignedIn) {
                  return const RootPage();
                }
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Utility.dynamicWidthPixel(16)),
                    child: SafeArea(
                        child: SingleChildScrollView(
                      child: Form(
                        key: c.registerFormKey,
                        child: Column(
                          children: [
                            Text(
                              "BİZE KATILIN",
                              style: TextStyle(fontSize: Utility.dynamicTextSize(32), fontFamily: "Medium"),
                            ),
                            SizedBox(
                              height: Utility.dynamicWidthPixel(16),
                            ),
                            Text(
                              "Kişisel bilgilerinizi girin ve SkyBee ile yolculuğa başlayın",
                              style: TextStyle(fontSize: Utility.dynamicTextSize(17), fontFamily: "Medium"),
                              textAlign: TextAlign.center,
                            ),
                            TextFormFieldApp.instance.widget(
                              context: context,
                              labelText: "Kullanıcı Adı",
                              errorStyle: TextStyle(color: ColorManager.instance.red),
                              keyboardType: TextInputType.name,
                              controller: c.usernameController,
                              validation: (val) {
                                if (val!.isEmpty) {
                                  return "Lütfen bu alanı doldurunuz.";
                                }
                                return null;
                              },
                              leadingIcon: Icon(
                                Icons.account_circle,
                                color: ColorManager.instance.darkGray.withOpacity(0.6),
                              ),
                            ),
                            TextFormFieldApp.instance.widget(
                              context: context,
                              labelText: "E-posta",
                              errorStyle: TextStyle(color: ColorManager.instance.red),
                              keyboardType: TextInputType.name,
                              controller: c.emailController,
                              validation: (val) {
                                if (val!.isEmpty) {
                                  return "Lütfen bu alanı doldurunuz.";
                                }
                                return null;
                              },
                              leadingIcon: Icon(
                                Icons.mail,
                                color: ColorManager.instance.darkGray.withOpacity(0.6),
                              ),
                            ),
                            TextFormFieldApp.instance.widget(
                              context: context,
                              labelText: "Şifre",
                              keyboardType: TextInputType.visiblePassword,
                              controller: c.passwordController,
                              errorStyle: TextStyle(color: ColorManager.instance.red),
                              obscureText: c.showPasswordForRegister,
                              leadingIcon: Icon(
                                Icons.lock,
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
                              suffixIcon: IconButton(
                                icon: Icon(
                                  c.showPasswordForRegister == true ? Icons.visibility_off : Icons.visibility,
                                  color: ColorManager.instance.darkGray.withOpacity(0.6),
                                ),
                                onPressed: () {
                                  c.showPasswordForRegister = !c.showPasswordForRegister;
                                  c.update();
                                },
                              ),
                            ),
                            SizedBox(
                              height: Utility.dynamicWidthPixel(16),
                            ),
                            Button(
                              color: ColorManager.instance.black,
                              title: "ÜYE OL",
                              textColor: ColorManager.instance.white.withOpacity(0.9),
                              onTap: () async {
                                await c.register();
                              },
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Text(
                                  "Üyeliğiniz var mı? Giriş yapın",
                                  style: TextStyle(
                                    color: ColorManager.instance.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                );
              },
            ),
          );
        });
  }
}
