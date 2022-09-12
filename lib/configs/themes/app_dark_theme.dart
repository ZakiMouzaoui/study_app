import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColor = Color(0xFF2e3c62);
const Color primaryDarkColor2 = Color(0xFF99ace1);

const mainTextColor = Colors.white;

class DarkTheme with SubThemeData{
  buildDarkTheme(){
    return ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColor,
            displayColor: mainTextColor
        )
    );
  }
}