import 'package:airport_project/core/base/base_state.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/init/theme/color_manager.dart';

class AirportProject {
  showGeneralDialog(
    BuildContext context, {
    String? title,
    bool? dismissible,
    required Widget body,
    Widget? icon,
    bool? autoDismiss,
  }) {
    if (autoDismiss == true) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        Get.back();
      });
    }

    return showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(barrierDismissible: dismissible ?? true),
      // barrierDismissible: dismissible ?? true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: ColorManager.instance.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ), //this right here
          child: Padding(
            padding: EdgeInsets.all(Utility.dynamicWidthPixel(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    title != null
                        ? Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: ColorManager.instance.darkGray,
                                fontSize: Utility.dynamicTextSize(20),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const SizedBox(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: icon ??
                          Container(
                            width: Utility.dynamicWidthPixel(36),
                            height: Utility.dynamicWidthPixel(36),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.instance.border_gray,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.close)
                            ),
                          ),
                    ),
                  ],
                ),
                body
              ],
            ),
          ),
        );
      },
    );
  }
}
