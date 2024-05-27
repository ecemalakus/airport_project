import 'package:airport_project/app/ui/pages/mytickets_page/widgets/ticket_data.dart';
import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../controllers/mytickets_controller.dart';

class MyTicketsPage extends GetView<MyTicketsController> {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.yellow,
      appBar: AppBar(
        backgroundColor: ColorManager.instance.white,
        title: Text(
          "BİLETLERİM",
          style: TextStyle(
              fontFamily: "Medium", fontSize: Utility.dynamicTextSize(17)),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MyTicketsController>(
          init: MyTicketsController(),
          builder: (c) {
            return Padding(
              padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Utility.dynamicWidthPixel(500),
                      child: PageView.builder(
                          controller: c.pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return TicketWidget(
                              width: Utility.dynamicWidthPixel(250),
                              height: Utility.dynamicWidthPixel(200),
                              isCornerRounded: true,
                              padding:
                                  EdgeInsets.all(Utility.dynamicWidthPixel(20)),
                              child: const TicketData(),
                            );
                          }),
                    ),
                    SizedBox(
                      height: Utility.dynamicWidthPixel(20),
                    ),
                    SmoothPageIndicator(
                      controller: c.pageController,
                      count: 5,
                      axisDirection: Axis.horizontal,
                      effect: SlideEffect(
                          spacing: 5.0,
                          radius: 4.0,
                          dotWidth: 12.0,
                          dotHeight: 12.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1,
                          dotColor: ColorManager.instance.blueDark,
                          activeDotColor: ColorManager.instance.black),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
