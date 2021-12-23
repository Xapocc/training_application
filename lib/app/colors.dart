import 'package:flutter/material.dart';

abstract class AppColors {
  // main screen
  static const Color colorBorderLoadingScreen = Colors.blue;
  static const Color colorBorderDataScreen = Colors.green;
  static const Color colorBorderErrorScreen = Colors.red;
  static const Color colorBackgroundMainScreen = Colors.black;
  static const Color colorForegroundMainScreen = Colors.white;

  // error screen
  static const Color colorFgCentralErrorMessage = Colors.yellow;
  static const Color colorBgCentralErrorMessage = Colors.purpleAccent;

  // error screen circles
  static const List<Color> colorsBorderMainScreenCircle = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.white
  ];
  static const List<Color> colorsTextMainScreenCircle = [
    Colors.orange,
    Colors.white,
    Colors.red,
    Colors.yellow
  ];

  // splash screen
  static const Color colorForegroundSplashScreen = Colors.black;
  static const List<Color> colorsBgGradientSplashScreen = [
    Colors.red,
    Colors.amber,
    Colors.amberAccent,
    Colors.yellow
  ];
}
