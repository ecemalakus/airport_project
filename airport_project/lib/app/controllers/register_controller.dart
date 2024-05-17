import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool showPasswordForRegister = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() async {
    if (registerFormKey.currentState!.validate()) {
      try {
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (credential.user?.email != null) {
          await FirebaseFirestore.instance.collection("users").doc(credential.user?.uid).set(
            {
              "username": usernameController.text,
              "email": emailController.text,
              "uid": credential.user?.uid,
            },
          );
        }
      } on FirebaseAuthException catch (e) {
        Get.closeAllSnackbars();
        final translator = GoogleTranslator();
        Translation translation = await translator.translate(e.message ?? "", to: 'tr');
        Get.snackbar("Error", translation.text, backgroundColor: Colors.white);
      } finally {}
    }
  }
}
