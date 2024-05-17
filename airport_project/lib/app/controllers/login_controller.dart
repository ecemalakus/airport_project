import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LoginController extends GetxController {
  PageController pageController = PageController();
  bool showPasswordForLogin = true;


  TextEditingController emailControllerForLogin = TextEditingController();
  TextEditingController passwordControllerForLogin = TextEditingController();

  
 TextEditingController resetPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControllerForLogin.text,
          password: passwordControllerForLogin.text,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.closeAllSnackbars();
      final translator = GoogleTranslator();
      Translation translation = await translator.translate(e.message ?? "", to: 'tr');
      Get.snackbar("Error", translation.text, backgroundColor: Colors.white);
    }
  }
}
