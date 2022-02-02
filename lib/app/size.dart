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
  static const double factorSizeIconSplashScreen = 0.2;

  // choose screen
  static const double factorWidthButtonChooseScreen = 0.7;
  static const double factorHeightButtonChooseScreen = 0.3;
  static const double fontSizeButtonChooseScreen = 32.0;
  static const double paddingButtonChooseScreen = 8.0;

  // task 4 screen
  static const double factorWidthTextFieldTask4Screen = 1.5;
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

  // statistic screen
  static const double widthStrokeProgressIndicatorStatisticScreen = 16.0;
  static const double factorWidthProgressIndicatorStatisticScreen = 0.33;
  static const double paddingTextProgressIndicatorStatisticScreen = 16.0;
  static const double fontSizeTextProgressIndicatorStatisticScreen = 24.0;
  static const double paddingTextStateCounterStatisticScreen = 16.0;
  static const double paddingListViewItemStatisticScreen = 8.0;
  static const double cacheItemsNumberStatisticScreen = 999999999.0;
  static const double scaleImageStatisticScreen = 0.2;
  static const int numberOfImagesInRowStatisticScreen = 2;
  static const bool showUncompletedRowStatisticScreen = true;
  static const int defaultCounterValueStatisticScreen = 0;

  // gps tracker
  static const double distanceFilterDefaultGpsTrackerScreen = 0;

  // default: 0.0005
  static const double distanceFilterGpsTrackerScreen = 0;

  static const int minLocationPointsGpsTrackerScreen = 2;
  static const double paddingFactorTrackingStateGpsTrackerScreen = 0.03;
  static const double paddingFactorTrackingIndicatorGpsTrackerScreen = 0.03;
  static const double paddingPauseStateGpsTrackerScreen = 8.0;
  static const double factorHeightPauseButtonGpsTrackerScreen = 0.2;
  static const double factorWidthPauseButtonGpsTrackerScreen = 0.7;
  static const double textSizeFactorPauseButtonGpsTrackerScreen = 0.1;
  static const double textSizeFactorTrackingIndicatorGpsTrackerScreen = 0.03;
  static const double factorWidthStartStopButtonGpsTrackerScreen = 1;
  static const double factorHeightStartStopButtonGpsTrackerScreen = 1;
  static const double paddingStartStopButtonGpsTrackerScreen = 8.0;



  // gps path map screen
  static const int lengthTabControllerGpsPathMapScreen = 2;
  static const double paddingListViewItemGpsPathMapScreen = 8.0;
  static const int flexIndexColumnGpsPathMapScreen = 3;
  static const int flexDataColumnGpsPathMapScreen = 12;
  static const int flexPaddingColumnGpsPathMapScreen = 1;
  static const double paddingButtonCameraGpsPathMapScreen = 16.0;
  static const double paddingIconButtonCameraGpsPathMapScreen = 16.0;
  static const double zoomCameraPositionGpsPathMapScreen = 17.0;
  static const int strokeWidthCircleGpsPathMapScreen = 4;
  static const double radiusCircleGpsPathMapScreen = 4.0;
  static const int widthPolylineGpsPathMapScreen = 4;
  static const double alphaMarkerGpsPathMapScreen = 0.5;
  static const double factorButtonCameraGpsPathMapScreen = 0.1;

  // repositories
  static const int millisecondsTimeoutDurationFirebaseRtdb = 300;
  static const int lastDateDefaultMilliseconds = 0;
}
