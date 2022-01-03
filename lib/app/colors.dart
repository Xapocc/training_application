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

  // task 4 screen
  static const Color colorBgTask4Screen = Colors.black;
  static const Color colorBgTextFieldTask4Screen = Colors.black;
  static const Color colorFgTextFieldTask4Screen = Colors.white;
  static const Color colorFgHintTextFieldTask4Screen = Colors.white30;
  static const Color colorFgTextStateCounterTaskScreen = Colors.white60;
  static const Color colorBgTextStateCounterTaskScreen = Colors.white60;

  static const Color colorFgButtonEnabledStartTask4Screen = Colors.black;
  static const Color colorBgButtonEnabledStartTask4Screen = Colors.white;
  static const Color colorOverlayButtonStartTask4Screen = Colors.black12;
  static const Color colorFgButtonDisabledStartTask4Screen = Colors.black54;
  static const Color colorBgButtonDisabledStartTask4Screen = Colors.white12;

  // statistic screen
  static const Color colorBgStatisticScreen = Colors.black;
  static const Color colorProgressIndicatorStatisticScreen = Colors.white;
  static const Color colorProgressTextStatisticScreen = Colors.white;
  static const Color colorTextDataStateStatisticScreen = Colors.green;
  static const Color colorTextErrorStateStatisticScreen = Colors.red;
}
