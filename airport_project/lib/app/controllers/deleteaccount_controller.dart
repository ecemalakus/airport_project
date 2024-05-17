import 'package:airport_project/app/ui/pages/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  void deleteUserAccount({required String email, required String password}) async {
    User user = FirebaseAuth.instance.currentUser!;

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

    await user.reauthenticateWithCredential(credential).then((value) {
      value.user?.delete().then((res) {
        Get.offAll(const LoginPage());
        Get.snackbar("Başarılı", "Hesabınız Silindi");
      });
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();
}
