import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  var totalLimitString = '0.00'.obs;
  var isLoading = true.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void fetchCards() async {
    isLoading(true);
    try {
      var snapshot = await firestore
          .collection('mycards')
          .doc(user!.uid)
          .collection('cards')
          .get();
      if (snapshot.docs.isNotEmpty) {
        double totalLimit = 0;
        for (var doc in snapshot.docs) {
          var card = doc.data();
          totalLimit += card['limit'] ?? 0;
        }
        totalLimitString.value = totalLimit.toStringAsFixed(2);
      } else {
        totalLimitString.value = '0.00';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch cards');
    } finally {
      isLoading(false);
    }
  }

  void deleteCard(String cardId) async {
    try {
      await firestore
          .collection('mycards')
          .doc(user!.uid)
          .collection('cards')
          .doc(cardId)
          .delete();
      fetchCards();
      Get.snackbar('Success', 'Kartınız başarıyla silindi.');
    } catch (e) {
      Get.snackbar('Error', 'Kart Silinemedi.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }
}
