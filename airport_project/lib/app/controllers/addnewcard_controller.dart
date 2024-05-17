import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCardController extends GetxController {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expirationMonthController = TextEditingController();
  TextEditingController expirationYearController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  void addCard({required String cardNumber, required String cardHolderName,required String expirationMonth,required String expirationYear,required String cvc,required double limit}) async {
    // Geçerli kullanıcıyı al
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Firestore referansını al
      CollectionReference myCards = FirebaseFirestore.instance.collection('mycards');

      // Kullanıcının kartlarını içerecek belgeyi oluştur
      DocumentReference userDocRef = myCards.doc(user.uid);

      // Kart bilgilerini belgeye ekle
      await userDocRef.collection('cards').add({
        'cardNumber': cardNumber,
        'cardHolderName': cardHolderName,
        'expirationMonth': expirationMonth,
        'expirationYear': expirationYear,
        'cvc': cvc,
        'limit': limit,
      });
    }
  }
}
