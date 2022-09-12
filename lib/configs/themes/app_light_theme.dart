import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColor = Color(0xFF3ac3cb);
const Color primaryLightColor2 = Color(0xFFF85157);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData{
  buildLightTheme(){
    return ThemeData.light().copyWith(
      primaryColor: primaryLightColor2,
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColor,
        displayColor: mainTextColor,
      )
    );
  }
}
