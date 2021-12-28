import 'package:flutter/material.dart';

abstract class AppColors {
  // main screen
  static const Color colorBorderLoadingScreen = Colors.blue;
  static const Color colorBorderDataScreen = Colors.green;
  static const Color colorBorderErrorScreen = Colors.red;
  static const Color colorBgTask3Screen = Colors.black;
  static const Color colorFgTask3Screen = Colors.white;

  // error screen
  static const Color colorFgCentralErrorMessage = Colors.yellow;
  static const Color colorBgCentralErrorMessage = Colors.purpleAccent;

  // error screen circles
  static const List<Color> colorsBorderCircleTask3Screen = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.white
  ];
  static const List<Color> colorsTextCircleTask3Screen = [
    Colors.orange,
    Colors.white,
    Colors.red,
    Colors.yellow
  ];

  // splash screen
  static const Color colorFgSplashScreen = Colors.black;
  static const List<Color> colorsBgGradientSplashScreen = [
    Colors.red,
    Colors.amber,
    Colors.amberAccent,
    Colors.yellow
  ];

  // choose screen
  static const Color colorBgChooseScreen = Colors.amberAccent;
  static const Color colorTextButtonChooseScreen = Colors.white;
  static const Color colorBgButtonChooseScreen = Colors.black;
}
