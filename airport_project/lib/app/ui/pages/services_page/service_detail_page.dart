import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String detailText;
  final String detailTitle;
  const ServiceDetailPage(
      {super.key, required this.detailText, required this.detailTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.yellow,
      appBar: AppBar(
        title: Text(
          detailTitle,
          style: TextStyle(
              fontFamily: "Medium", fontSize: Utility.dynamicTextSize(16)),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.instance.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.all(Utility.dynamicWidthPixel(50)),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(Utility.dynamicWidthPixel(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorManager.instance.black,
              ),
            ),
            child: Text(detailText,
                style: TextStyle(
                    fontFamily: "Medium",
                    fontSize: Utility.dynamicTextSize(16))),
          ),
        ),
      ),
    );
  }
}
