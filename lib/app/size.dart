abstract class AppSizes {
  // splash screen
  static const int delayStart = 3;

  // task 3 screen
  static const double widthBorderTask3Screen = 5.0;
  static const double radiusBorderTask3Screen = 45.0;
  static const int secondsLoadingTimeTask3Screen = 2;

  // error screen
  static const double widthBorderErrorCircle = 5.0;
  static const double fontSizeCentralErrorMessage = 24.0;
  static const double paddingErrorScreen = 8.0;
  static const double paddingCentralErrorMessage = 8.0;
  static const double paddingCircleErrorMessage = 16.0;
  static const double minFontSizeCircleErrorMessage = 3.0;

  // splash screen
  static const List<double> stopsGradientBgSplashScreen = [0.1, 0.4, 0.6, 1];
  static const double radiusGradientBgSplashScreen = 2.5;
  static const double coefficientSizeIconSplashScreen = 0.2;

  // choose screen
  static const double coefficientWidthButtonChooseScreen = 0.7;
  static const double coefficientHeightButtonChooseScreen = 0.11;
  static const double fontSizeButtonChooseScreen = 32.0;
  static const double paddingButtonChooseScreen = 8.0;

  // task 4 screen
  static const double coefficientWidthTextFieldTask4Screen = 1.5;
  static const int maxLengthTextFieldTask4Screen = 2;
  static const double fontSizeTextFieldTask4Screen = 64.0;
  static const int parserExReplacerTextFieldTask4Screen = 1;
  static const double paddingButtonStartTask4Screen = 16.0;
  static const double paddingContainerStatisticsTask4Screen = 8.0;
  static const double paddingDataStateCounterTask4Screen = 16.0;
  static const double fontSizeTextStateCounterTask4Screen = 16.0;
  static const int secondsMinAllowedTask4Screen = 1;
  static const int secondsMaxAllowedTask4Screen = 10;

  // randomizer
  static const int randomMaxValue = 100;
  static const int randomDivider = 2;
  static const int randomDataStateDivRem = 0;

  // statistic screen
  static const double widthStrokeProgressIndicatorStatisticScreen = 16.0;
  static const double coefficientWidthProgressIndicatorStatisticScreen = 0.33;
  static const double paddingTextProgressIndicatorStatisticScreen = 16.0;
  static const double fontSizeTextProgressIndicatorStatisticScreen = 24.0;
  static const double paddingTextStateCounterStatisticScreen = 16.0;
  static const double paddingListViewItemStatisticScreen = 8.0;
  static const double cacheItemsNumberStatisticScreen = 999999999.0;
  static const double scaleImageStatisticScreen = 0.2;
  static const int numberOfImagesInRowStatisticScreen = 2;
  static const bool showUncompletedRowStatisticScreen = true;
  static const int defaultCounterValueStatisticScreen = 0;

  // repositories
  static const int millisecondsTimeoutDurationFirebaseRtdb = 300;
  static const int lastDateDefaultMilliseconds = 0;
}
