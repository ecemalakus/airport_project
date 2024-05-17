import 'package:airport_project/app/controllers/addnewcard_controller.dart';
import 'package:airport_project/app/controllers/airportshoppingstores_controller.dart';
import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:credit_card_form/credit_card_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewCardController>(
        init: AddNewCardController(),
        builder: (c) {
          return Scaffold(
            backgroundColor: ColorManager.instance.blue,
            appBar: AppBar(
              backgroundColor: ColorManager.instance.blue,
              title: Text(
                'Yeni Kart Ekle',
                style: TextStyle(fontSize: Utility.dynamicTextSize(18), fontFamily: "Medium"),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      theme: CreditCardDarkTheme(),
                      onChanged: (CreditCardResult result) {
                        print(result.cardNumber);
                        c.cardNumberController.text = result.cardNumber;
                        print(result.cardHolderName);
                        c.cardHolderNameController.text = result.cardHolderName;
                        print(result.expirationMonth);
                        c.expirationMonthController.text = result.expirationMonth;
                        print(result.expirationYear);
                        c.expirationYearController.text = result.expirationYear;
                        print(result.cvc);
                        c.cvcController.text = result.cvc;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(12)),
                      child: Button(
                        color: ColorManager.instance.black,
                        onTap: () {
                          c.addCard(
                            cardNumber: c.cardNumberController.text,
                            cardHolderName: c.cardHolderNameController.text,
                            expirationMonth: c.expirationMonthController.text,
                            expirationYear: c.expirationYearController.text,
                            cvc: c.cvcController.text,
                            limit: 100.00,
                          );
                          AirportShoppingStoresController walletController = Get.put(AirportShoppingStoresController());
                          walletController.calculateTotalPrice();
                          Get.closeAllSnackbars();
                          Get.snackbar("Başarılı", "Kartınız Başarıyla Eklendi");
                          Navigator.pop(context);
                        },
                        title: "Kart Ekle",
                        textColor: ColorManager.instance.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
