import 'package:airport_project/app/ui/global_widgets/button.dart';
import 'package:airport_project/app/ui/global_widgets/custom_dialog.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/airportshoppingstores_controller.dart';

class BasketPage extends GetView<AirportShoppingStoresController> {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirportShoppingStoresController>(
      initState: (state) {
        AirportShoppingStoresController c = Get.find();
        c.calculateTotalPrice();
      },
      builder: (c) {
        return Scaffold(
            bottomSheet: Container(
              color: ColorManager.instance.yellow,
              height: Utility.dynamicWidthPixel(100),
              child: Column(
                children: [
                  SizedBox(
                    height: Utility.dynamicWidthPixel(5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sipariş Toplamı:",
                        style: TextStyle(
                          fontFamily: "Medium",
                          color: ColorManager.instance.white,
                          fontSize: Utility.dynamicTextSize(17),
                        ),
                      ),
                      SizedBox(
                        width: Utility.dynamicWidthPixel(30),
                      ),
                      Text(
                        "${c.calculateTotalPrice()} TL",
                        style: TextStyle(
                          fontFamily: "Medium",
                          color: ColorManager.instance.white,
                          fontSize: Utility.dynamicTextSize(17),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Utility.dynamicWidthPixel(50)),
                    child: Button(
                      color: ColorManager.instance.white,
                      onTap: () {
                        AirportProject().showGeneralDialog(context,
                            body: Column(
                              children: [
                                Text(
                                  "Siparişi Tamamlamak İstiyor musunuz ?",
                                  style: TextStyle(
                                    fontFamily: "Medium",
                                    color: ColorManager.instance.black,
                                    fontSize: Utility.dynamicTextSize(16),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Button(
                                        onTap: () {
                                          Get.back();
                                        },
                                        color: ColorManager.instance.white,
                                        textColor: ColorManager.instance.black,
                                        borderColor:
                                            ColorManager.instance.black,
                                        title: "Vazgeç",
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utility.dynamicWidthPixel(10),
                                    ),
                                    Expanded(
                                      child: Button(
                                        onTap: () {
                                          c.makePayment();
                                        },
                                        color: ColorManager.instance.black,
                                        textColor: ColorManager.instance.white,
                                        borderColor:
                                            ColorManager.instance.black,
                                        title: "Evet",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                      title: "ÖDEME YAP",
                      textColor: ColorManager.instance.black,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: ColorManager.instance.white,
            appBar: AppBar(
              backgroundColor: ColorManager.instance.white,
              centerTitle: true,
              actions: [
                Padding(
                  padding:
                      EdgeInsets.only(right: Utility.dynamicWidthPixel(16)),
                  child: InkWell(
                    onTap: () {
                      AirportProject().showGeneralDialog(context,
                          body: Column(
                            children: [
                              Text(
                                "Sepetinizi temizlemek istediğinize emin misiniz ?",
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  color: ColorManager.instance.black,
                                  fontSize: Utility.dynamicTextSize(16),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Button(
                                      onTap: () {
                                        Get.back();
                                      },
                                      color: ColorManager.instance.white,
                                      textColor: ColorManager.instance.black,
                                      borderColor: ColorManager.instance.black,
                                      title: "Vazgeç",
                                    ),
                                  ),
                                  SizedBox(
                                    width: Utility.dynamicWidthPixel(10),
                                  ),
                                  Expanded(
                                    child: Button(
                                      onTap: () {
                                        c.shoppingCart.clear();
                                        c.update();
                                        Get.back();
                                      },
                                      color: ColorManager.instance.black,
                                      textColor: ColorManager.instance.white,
                                      borderColor: ColorManager.instance.black,
                                      title: "Evet",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                    child: Icon(
                      Icons.delete,
                      size: Utility.dynamicWidthPixel(26),
                      color: ColorManager.instance.black,
                    ),
                  ),
                ),
              ],
              title: Text(
                'Sepetim',
                style: TextStyle(
                  fontFamily: "Medium",
                  color: ColorManager.instance.black,
                  fontSize: Utility.dynamicTextSize(21),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: Utility.dynamicWidthPixel(50),
                  right: Utility.dynamicWidthPixel(50),
                  bottom: Utility.dynamicWidthPixel(110)),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: c.shoppingCart.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorManager.instance.yellow,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.instance.black)),
                    height: Utility.dynamicWidthPixel(350),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: c.shoppingCart[index].image,
                            height: Utility.dynamicWidthPixel(200),
                            width: Utility.dynamicWidthPixel(200),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Utility.dynamicWidthPixel(10)),
                          child: Column(
                            children: [
                              Text(
                                c.shoppingCart[index].name,
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  color: ColorManager.instance.white,
                                  fontSize: Utility.dynamicTextSize(16),
                                ),
                              ),
                              Text(
                                "${(c.shoppingCart[index].price * c.shoppingCart[index].quantity).toStringAsFixed(2)} TL",
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  color: ColorManager.instance.white,
                                  fontSize: Utility.dynamicTextSize(16),
                                ),
                              ),
                              Text(
                                "Miktar: ${c.shoppingCart[index].quantity}",
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  color: ColorManager.instance.white,
                                  fontSize: Utility.dynamicTextSize(16),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: ColorManager.instance.white,
                                    ),
                                    onPressed: () {
                                      // Miktarı azalt
                                      if (c.shoppingCart[index].quantity > 1) {
                                        c.shoppingCart[index].quantity -= 1;
                                        c.update();
                                        c.calculateTotalPrice();
                                      }
                                    },
                                  ),
                                  Text(
                                    "${c.shoppingCart[index].quantity}",
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      color: ColorManager.instance.white,
                                      fontSize: Utility.dynamicTextSize(16),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: ColorManager.instance.white,
                                    ),
                                    onPressed: () {
                                      // Miktarı artır

                                      c.shoppingCart[index].quantity += 1;
                                      c.update();
                                      c.calculateTotalPrice();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
