import 'package:airport_project/app/ui/global_widgets/custom_dialog.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/shopping_controller.dart';

class ShoppingPage extends GetView<ShoppingController> {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Reklam resimlerinin URL'lerini içeren liste
    final List<String> adImages = [
      "https://images.migrosone.com/sanalmarket/product/51980623/51980623-ec6017-1650x1650.jpg",
      "https://st.kuponrazzi.com/images/kampanya/dominos-pizza/dominos.png",
      "https://content.sbuxtr.com/images/541faecb-a696-4416-a3ad-e4886efa7121.png",
      "https://cdn-sams.akinon.net/cms/2021/01/15/4ce1b660-c5dc-4e21-8333-86c07dc51956.jpg",
      "https://kredikartlari.net/img/kampanya/axess-atu-duty-free-ocak-2019.webp",
      "https://www.watsons.com.tr/medias/sys_master/root/h34/h0b/9040266395678/yildonumu3/yildonumu3.png",
    ];

    return GetBuilder<ShoppingController>(
      init: ShoppingController(),
      builder: (c) {
        return Scaffold(
          backgroundColor: ColorManager.instance.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Utility.dynamicWidthPixel(16)),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: Utility.dynamicWidthPixel(220),
                        viewportFraction: 0.6,
                        autoPlay: true, // Otomatik geçiş yapmasını istiyorsanız
                      ),
                      items: adImages.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Utility.dynamicWidthPixel(8)),
                                decoration: BoxDecoration(
                                    color: ColorManager.instance.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Utility.dynamicWidthPixel(8)),
                    child: Text(
                      "Kategoriler",
                      style: TextStyle(
                          fontSize: Utility.dynamicTextSize(19),
                          fontFamily: "Medium"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: c.categories.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              AirportProject().showGeneralDialog(
                                context,
                                title: c.categories[index].name,
                                body: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: c.categories[index].brands.length,
                                  itemBuilder: (context, j) {
                                    return Padding(
                                      padding: EdgeInsets.all(
                                          Utility.dynamicWidthPixel(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              c.categories[index].brands[j]
                                                  .name,
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize:
                                                      Utility.dynamicTextSize(
                                                          13),
                                                  color: Colors.black)),
                                          Text(
                                              c.categories[index].brands[j]
                                                  .location,
                                              style: TextStyle(
                                                  fontFamily: "Medium",
                                                  fontSize:
                                                      Utility.dynamicTextSize(
                                                          13),
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorManager.instance.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: ColorManager.instance.black)),
                              child: Text(
                                c.categories[index].name,
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: Utility.dynamicTextSize(16),
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ), // Yazı rengi beyaz
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
