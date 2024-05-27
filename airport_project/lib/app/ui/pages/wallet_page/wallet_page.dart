import 'package:airport_project/app/controllers/wallet_controller.dart';
import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/pages/addnewcard_page/addnewcard_page.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
      builder: (c) {
        return Scaffold(
          backgroundColor: ColorManager.instance.white,
          appBar: AppBar(
            backgroundColor: ColorManager.instance.yellow,
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  c.fetchCards();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Utility.dynamicWidthPixel(36)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "CÜZDANIM",
                        style: TextStyle(
                            fontFamily: "Medium",
                            fontSize: Utility.dynamicTextSize(37)),
                      ),
                      SizedBox(
                        height: Utility.dynamicWidthPixel(24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Toplam Bakiye: ",
                            style: TextStyle(
                                fontFamily: "Medium",
                                fontSize: Utility.dynamicTextSize(19)),
                          ),
                          Obx(() => Text(
                                "${c.totalLimitString} TL",
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: Utility.dynamicTextSize(19)),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: Utility.dynamicWidthPixel(8),
                      ),
                      Button(
                        color: ColorManager.instance.black,
                        onTap: () {
                          pushNewScreen(context,
                              screen: const AddNewCardPage(), withNavBar: true);
                        },
                        title: "Yeni Kart Ekle",
                        textColor: ColorManager.instance.white,
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Obx(() {
                  if (c.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('mycards')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('cards')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                            'Kayıtlı Kartınız Bulunmamaktadır',
                            style: TextStyle(
                                fontFamily: "Medium",
                                fontSize: Utility.dynamicTextSize(17)),
                          ),
                        );
                      }

                      List<QueryDocumentSnapshot<Object?>> cardDocuments =
                          snapshot.data!.docs;

                      return ListView.builder(
                        itemCount: cardDocuments.length,
                        itemBuilder: (context, index) {
                          var cardData = cardDocuments[index].data()
                              as Map<String, dynamic>;
                          var cardId = cardDocuments[index].id;
                          return Column(
                            children: [
                              CreditCardWidget(
                                cardNumber: cardData["cardNumber"],
                                expiryDate:
                                    "${cardData["expirationMonth"]}/${cardData["expirationYear"]}",
                                cardHolderName: cardData["cardHolderName"],
                                cvvCode: cardData["cvc"],
                                showBackView: false,
                                obscureCardNumber: true,
                                obscureCardCvv: true,
                                isHolderNameVisible: true,
                                cardBgColor: ColorManager.instance.grayBorder,
                                isSwipeGestureEnabled: true,
                                onCreditCardWidgetChange:
                                    (CreditCardBrand creditCardBrand) {},
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Utility.dynamicWidthPixel(8)),
                                child: Button(
                                  color: ColorManager.instance.yellow,
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('mycards')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection('cards')
                                        .doc(cardId)
                                        .delete();
                                    Get.snackbar("Başarılı",
                                        "Kartınız Başarıyla Silindi");
                                  },
                                  title: "Kartı Sil",
                                  textColor: ColorManager.instance.white,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
