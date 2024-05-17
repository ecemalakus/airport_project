import 'package:airport_project/app/ui/global_widgets/textformfield.dart';
import 'package:airport_project/app/ui/pages/services_page/service_detail_page.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../controllers/services_controller.dart';

class ServicesPage extends GetView<ServicesController> {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicesController>(
      init: ServicesController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.instance.blue,
          ),
          backgroundColor: ColorManager.instance.blue,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Utility.dynamicWidthPixel(24),
                  right: Utility.dynamicWidthPixel(24),
                ),
                child: TextFormFieldApp.instance.widget(
                  onChanged: (val) {
                    c.update();
                  },
                  context: context,
                  labelText: "Hizmetleri Ara",
                  keyboardType: TextInputType.visiblePassword,
                  controller: c.searchController,
                  errorStyle: TextStyle(color: ColorManager.instance.red),
                  leadingIcon: Icon(
                    Icons.search,
                    color: ColorManager.instance.darkGray.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Utility.dynamicWidthPixel(8)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: c.airportServices.length,
                      itemBuilder: (context, index) {
                        final service = c.airportServices[index];
                        if (c.searchController.text.isEmpty ||
                            service.name.toLowerCase().contains(
                                  c.searchController.text.toLowerCase(),
                                )) {
                          return Card(
                            child: InkWell(
                              onTap: () {
                                pushNewScreen(context,
                                    screen: ServiceDetailPage(
                                      detailText: service.details,
                                      detailTitle: service.name,
                                    ),
                                    withNavBar: true);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    service.name,
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: Utility.dynamicTextSize(16),
                                    ),
                                    textAlign: TextAlign.center,
                                  ), // İsim
                                  Icon(c.getIconDataFromString(service.iconData)),
                                ],
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
              ),
            ],
          ),
        );
      },
    );
  }
}
