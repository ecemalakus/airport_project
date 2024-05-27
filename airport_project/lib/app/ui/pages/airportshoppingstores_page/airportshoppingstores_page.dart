import 'package:airport_project/app/ui/pages/basket_page/basket_page.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../controllers/airportshoppingstores_controller.dart';
import '../../global_widgets/textformfield.dart';
import 'airportshoppingstores_detail_page.dart';

class AirportShoppingStoresPage
    extends GetView<AirportShoppingStoresController> {
  const AirportShoppingStoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirportShoppingStoresController>(
        init: Get.put(AirportShoppingStoresController(), permanent: true),
        builder: (c) {
          return Scaffold(
            backgroundColor: ColorManager.instance.white,
            appBar: AppBar(
              backgroundColor: ColorManager.instance.yellow, //değişti yukarıda
              actions: [
                Padding(
                  padding:
                      EdgeInsets.only(right: Utility.dynamicWidthPixel(12)),
                  child: InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: const BasketPage(), withNavBar: true);
                    },
                    child: Icon(
                      Icons.shopping_basket,
                      size: Utility.dynamicWidthPixel(35),
                      color: ColorManager.instance.black,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
              child: Column(
                children: [
                  TextFormFieldApp.instance.widget(
                    onChanged: (val) {
                      c.update();
                    },
                    context: context,
                    labelText: "Markaları Ara",
                    keyboardType: TextInputType.visiblePassword,
                    controller: c.searchController,
                    errorStyle: TextStyle(color: ColorManager.instance.red),
                    leadingIcon: Icon(
                      Icons.search,
                      color: ColorManager.instance.darkGray.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: Utility.dynamicWidthPixel(20),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: c.airportBrands.length,
                        itemBuilder: (context, index) {
                          final brand = c.airportBrands[index];
                          if (c.searchController.text.isEmpty ||
                              brand.name.toLowerCase().contains(
                                  c.searchController.text.toLowerCase())) {
                            return GestureDetector(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: AirportShoppingStoresDetailPage(
                                        brandName: brand.name,
                                        products: brand.products),
                                    withNavBar: true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(brand.image),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.8),
                                      BlendMode.darken,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    brand.name,
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      color: ColorManager.instance.white,
                                      fontSize: Utility.dynamicTextSize(16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
