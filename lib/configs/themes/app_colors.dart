import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

import 'app_light_theme.dart';

const mainGradientLight = LinearGradient(
    colors: [
      primaryLightColor,
      primaryLightColor2
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
);

const mainGradientDark = LinearGradient(
    colors: [
      primaryDarkColor,
      primaryDarkColor2
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
);

LinearGradient linearGradient(BuildContext context){
  if(UiParameters.isDarkMode(context)){
    return mainGradientDark;
  }
  return mainGradientLight;
}

const Color onSurfaceTextColor = Colors.white;

Color customScaffoldColor(context) => Get.isDarkMode
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);