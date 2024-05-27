import 'package:airport_project/core/base/base_state.dart';
import 'package:airport_project/core/init/theme/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Widget buildZoomableImage(String mapPath) {
    return PinchZoom(
      image: CachedNetworkImage(imageUrl: mapPath),
      zoomedBackgroundColor: ColorManager.instance.white,
      resetDuration: const Duration(milliseconds: 100),
      maxScale: 2.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodies = [
      Column(
        children: [
          Expanded(
              flex: 1,
              child: buildZoomableImage(
                  "https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gidis-kati_2.jpg")),
          Expanded(
            flex: 1,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(40.1281, 32.9951),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('esenboga'),
                  position: LatLng(40.1281, 32.9951),
                  infoWindow: InfoWindow(title: 'Ankara Esenboğa Havalimanı'),
                ),
              },
            ),
          ),
        ],
      ),
      Column(
        children: [
          Expanded(
              flex: 1,
              child: buildZoomableImage(
                  "https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gelis-asma-kati_2.jpg")),
          Expanded(
            flex: 1,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(40.1281, 32.9951),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('esenboga'),
                  position: LatLng(40.1281, 32.9951),
                  infoWindow: InfoWindow(title: 'Ankara Esenboğa Havalimanı'),
                ),
              },
            ),
          ),
        ],
      ),
      Column(
        children: [
          Expanded(
              flex: 1,
              child: buildZoomableImage(
                  "https://webcmsesb.tav.aero/uploads/5a13ca9ea79d053db4eaaa60/dynamic-fields/images/gelis-kati_2.jpg")),
          Expanded(
            flex: 1,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(40.1281, 32.9951),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('esenboga'),
                  position: LatLng(40.1281, 32.9951),
                  infoWindow: InfoWindow(title: 'Ankara Esenboğa Havalimanı'),
                ),
              },
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: ColorManager.instance.white,
      body: bodies[theriGroupVakue],
      appBar: AppBar(
        backgroundColor: ColorManager.instance.white,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, Utility.dynamicWidthPixel(45)),
          child: Padding(
            padding: EdgeInsets.only(
                top: Utility.dynamicWidthPixel(5),
                bottom: Utility.dynamicWidthPixel(10)),
            child: Row(
              children: [
                SizedBox(
                  width: Utility.dynamicWidthPixel(3),
                ),
                Expanded(
                  child: CupertinoSegmentedControl(
                    selectedColor: ColorManager.instance.yellow,
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
