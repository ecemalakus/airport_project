import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = <int, Widget>{
    0: Text(
      "Gidiş Katı",
      style: TextStyle(color: ColorManager.instance.white),
    ),
    1: Text(
      "Geliş Asma Katı",
      style: TextStyle(color: ColorManager.instance.white),
    ),
    2: Text(
      "Geliş Katı",
      style: TextStyle(color: ColorManager.instance.white),
    )
  };

  static Widget giveCenter(String mapPath) {
    return Center(child: PinchZoom(maxScale: 2.5, child: CachedNetworkImage(imageUrl: mapPath)));
  }

  List<Widget> bodies = [giveCenter("https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gidis-kati_2.jpg"), giveCenter("https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gelis-asma-kati_2.jpg"), giveCenter("https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gelis-kati_2.jpg")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance.blue,
      body: bodies[theriGroupVakue],
      appBar: AppBar(
        backgroundColor: ColorManager.instance.blue,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, Utility.dynamicWidthPixel(45)),
          child: Padding(
            padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(5), bottom: Utility.dynamicWidthPixel(10)),
            child: Row(
              children: [
                SizedBox(
                  width: Utility.dynamicWidthPixel(3),
                ),
                Expanded(
                  child: CupertinoSegmentedControl(
                    selectedColor: ColorManager.instance.blueDark,
                    unselectedColor: ColorManager.instance.greyDark,
                    borderColor: ColorManager.instance.darkGray,
                    groupValue: theriGroupVakue,
                    onValueChanged: (changeFromGroupValue) {
                      setState(() {
                        theriGroupVakue = changeFromGroupValue;
                      });
                    },
                    children: logoWidgets,
                  ),
                ),
                SizedBox(
                  width: Utility.dynamicWidthPixel(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
