import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/discover_controller.dart';

class DiscoverInfoPage extends GetView<DiscoverController> {
  const DiscoverInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
        init: DiscoverController(),
        builder: (c) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const NetworkImage(
                    "https://sanayihaberajansi.com.tr/wp-content/uploads/2023/10/193324478.jpg",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(Utility.dynamicWidthPixel(24)),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.instance.black,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.instance.white),
                  height: Utility.dynamicWidthPixel(250),
                  width: Get.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bizi Daha Yakından Tanıyın",
                          style: TextStyle(fontSize: Utility.dynamicTextSize(26), fontFamily: "Medium"),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: Utility.dynamicWidthPixel(24),
                        ),
                        InkWell(
                          onTap: () {
                            //todo url launcher ile yönlendirme yap
                            c.launchInWebView(Uri.parse("https://ecemalakus0.wixsite.com/skybee"));
                          },
                          child: Text(
                            "https://ecemalakus0.wixsite.com/skybee",
                            style: TextStyle(fontSize: Utility.dynamicTextSize(18), fontFamily: "Medium"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ),
          );
        });
  }
}
