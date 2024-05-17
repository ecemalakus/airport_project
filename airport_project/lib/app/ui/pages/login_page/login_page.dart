import 'package:airport_project/app/controllers/login_controller.dart';
import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:airport_project/app/ui/pages/forgotpassword_page/forgotpassword_page.dart';
import 'package:airport_project/app/ui/pages/register_page/register_page.dart';
import 'package:airport_project/app/ui/pages/root_page/root_page.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/init/theme/color_manager.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) {
          return Scaffold(
              backgroundColor: ColorManager.instance.darkblack,
              body: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final isSignedIn = snapshot.data != null;
                  if (isSignedIn) {
                    return const RootPage();
                  }
                  return Center(
                    child: SafeArea(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Utility.dynamicWidthPixel(16)),
                        child: Form(
                          key: c.loginFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "HOŞGELDİNİZ",
                                style: TextStyle(
                                    color: ColorManager.instance.white,
                                    fontSize: Utility.dynamicTextSize(32),
                                    fontFamily: "Medium"),
                              ),
                              SizedBox(
                                height: Utility.dynamicWidthPixel(16),
                              ),
                              Text(
                                "Devam etmek için giriş yapınız",
                                style: TextStyle(
                                    color: ColorManager.instance.white,
                                    fontSize: Utility.dynamicTextSize(17),
                                    fontFamily: "Medium"),
                              ),
                              TextFormFieldApp.instance.widget(
                                context: context,
                                labelText: "E-posta",
                                errorStyle:
                                    TextStyle(color: ColorManager.instance.red),
                                keyboardType: TextInputType.name,
                                controller: c.emailControllerForLogin,
                                validation: (val) {
                                  if (val!.isEmpty) {
                                    return "Lütfen bu alanı doldurunuz.";
                                  }
                                  return null;
                                },
                                leadingIcon: Icon(
                                  Icons.mail,
                                  color: ColorManager.instance.darkGray
                                      .withOpacity(0.6),
                                ),
                              ),
                              TextFormFieldApp.instance.widget(
                                context: context,
                                labelText: "Şifre",
                                keyboardType: TextInputType.visiblePassword,
                                controller: c.passwordControllerForLogin,
                                errorStyle:
                                    TextStyle(color: ColorManager.instance.red),
                                obscureText: c.showPasswordForLogin,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    c.showPasswordForLogin == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorManager.instance.darkGray
                                        .withOpacity(0.6),
                                  ),
                                  onPressed: () {
                                    c.showPasswordForLogin =
                                        !c.showPasswordForLogin;
                                    c.update();
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Utility.dynamicWidthPixel(12)),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        pushNewScreen(context,
                                            screen: const ForgotPasswordPage());
                                      },
                                      child: Text(
                                        "Parolamı Unuttum",
                                        style: TextStyle(
                                          color: ColorManager.instance.white,
                                          // 'const' kaldırıldı
                                          decoration: TextDecoration.underline,
                                          fontFamily: "Medium",
                                        ),
                                      ),
                                    )),
                              ),
                              Button(
                                color: ColorManager.instance.yellow,
                                title: "GİRİŞ YAP",
                                textColor: ColorManager.instance.white
                                    .withOpacity(0.9),
                                onTap: () async {
                                  await c.login();
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  pushNewScreen(context,
                                      screen: const RegisterPage());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Text(
                                    "Üyeliğiniz yok mu? Üye olun",
                                    style: TextStyle(
                                      color: ColorManager.instance.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  );
                },
              ));
        });
  }
}
