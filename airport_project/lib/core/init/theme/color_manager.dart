// ignore_for_file: prefer_conditional_assignment, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();

  Color get darkblack =>
      const Color(0xff000000); // Daha standart bir siyah kullanılabilir.
  Color get yellow => const Color(0xffffd700); // Standart parlak sarı.
  Color get lightYellow =>
      Color.fromARGB(255, 245, 231, 104); // Açık sarı renk için hex kodu.
  Color get white => const Color(0xffffffff);
  Color get gray => const Color(0xffa5a6ae);
  Color get border_gray => const Color(0xFFd3d3d3);
  Color get spacer_gray => const Color(0xffececec);
  Color get darkGray => const Color(0xff383838);
  Color get black => const Color(0xff020306);
  Color get transparent => const Color(0x00000000);
  Color get primary => const Color(0xFFFC0B7B);
  Color get greyBG => const Color(0xFFF2F2F2);
  Color get gold => const Color(0xFFFBBE49);
  Color get greyDark => const Color(0xFF939393);
  Color get secondary => const Color(0xFFFC0B7B);
  Color get secondaryLight => const Color(0xFFBABBBF);
  Color get tweetText => const Color(0xFF272828);
  Color get blue => const Color(0xFF9dd5f2);
  Color get red => const Color(0xFFFF4E43);
  Color get green => const Color(0xFF20A090);
  Color get grayBorder => const Color(0xFFF0F0F0);
  Color get pink => const Color(0xFFFDF7FD);
  Color get mor => const Color(0xFF6749F4);
  Color get griText => const Color(0xffC1C0C5);
  Color get blueDark => const Color(0xff155170);
  Color get blueSoft => const Color(0xffa9c2cf);

  MaterialColor get materialGray => const MaterialColor(
        0xff000000,
        <int, Color>{
          50: Colors.black,
          100: Colors.black,
          200: Colors.black,
          300: Colors.black,
          400: Colors.black,
          500: Colors.black,
          600: Colors.black,
          700: Colors.black,
          800: Colors.black,
          900: Colors.black,
        },
      );
}
