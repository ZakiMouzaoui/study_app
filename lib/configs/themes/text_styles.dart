import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';

TextStyle cardTitle(context) => TextStyle(
    color: Get.isDarkMode
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 18
);

TextStyle detailStyle(context) => TextStyle(
    color: Get.isDarkMode
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 14
);

TextStyle headerText(context) => const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor
);

TextStyle? answerCardStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14
);