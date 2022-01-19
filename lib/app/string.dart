abstract class AppStrings {
  static const String apiKeyGoogleMaps =
      "AIzaSyAHPZ12iDgKw6cAjz88u2OlCDNNtedWBpY";

  // choose screen
  static const String textButton0ChooseScreen = "Task 3 Screen";
  static const String textButton1ChooseScreen = "Task 4 Screen";
  static const String textButton2ChooseScreen = "Gps Tracker Screen";

  // task 3 screen
  static const String dataTask3Screen = "data";
  static const String errorMessageTestTask3Screen =
      "some long error text with a lot of symbols and words for testing your error screen as it should display every error`s message despite how long it is";

  // task 4 screen
  static const String textButtonStartTimerTask4Screen = "Start";
  static const String textHintDefaultTask4Screen = "1";
  static const String formatLastDate = 'dd MMM yyyy';

  static String stateCountersTextTask4Screen(counter, hasData) =>
      "${hasData ? "Data" : "Error"} state\nappeared $counter time${counter == 1 ? "" : "s"}";

  static String stateLastDateTextTask4Screen(date, hasData) =>
      "Last ${hasData ? "data" : "error"} state\nappearance date\nis $date";

  // statistic screen
  static const String timeFieldNameStatisticScreen = "time";
  static const String dataStateFieldNameStatisticScreen = "dataStateCounter";
  static const String errorStateFieldNameStatisticScreen = "errorStateCounter";
  static const String dataStateLastDateFieldNameStatisticScreen =
      "dataStateLastDate";
  static const String errorStateLastDateFieldNameStatisticScreen =
      "errorStateLastDate";
  static const String imagesUrlsFieldNameStatisticScreen = "imagesUrls";

  static String spinnerTextStatisticScreen(time) =>
      "Please wait $time second${time == 1 ? "" : "s"}";

  static String stateCountersTextStatisticScreen(counter, hasData) =>
      "${hasData ? "Data" : "Error"} state appeared $counter time${counter == 1 ? "" : "s"} now";

  static String stateLastDateTextStatisticScreen(lastDate) =>
      "\nLast appearance date is $lastDate";

  // gps tracker screen
  static const String nextButtonPauseStateGpsTrackerScreen = "Show Path";
  static const String backButtonPauseStateGpsTrackerScreen = "Start Again";
  static const String trackingTrackingIndicatorGpsTrackerScreen = "Tracking...";

  static String counterTrackingIndicatorGpsTrackerScreen(count) =>
      "GPS points saved: $count";

  static String buttonTrackingStateGpsTrackerScreen(bool isTracking) =>
      !isTracking ? "START\nTRACKING" : "STOP\nTRACKING";

  // gps path map screen
  static const String latitudeFullGpsPathMapScreen = "latitude";
  static const String longitudeFullGpsPathMapScreen = "longitude";
  static const String latitudeShortGpsPathMapScreen = "lat";
  static const String longitudeShortGpsPathMapScreen = "lng";
  static const String messageDataIsMissingGpsPathMapScreen =
      "Locations data is missing";
  static const String messageInternetConnectionGpsPathMapScreen =
      "Can't connect to google maps services.\nPlease check your internet connection.";
  static const String markerIdGpsPathMapScreen = "end";
  static const String polylineIdGpsPathMapScreen = "path";

  static String indexColumnListViewItemGpsPathMapScreen(index) =>
      "${index + 1}. ";

  static String dataColumnListViewItemGpsPathMapScreen(
          String fieldName, double? value) =>
      "$fieldName. $value";

  static String circleIdGpsPathMapScreen(int index) => "circle_$index";

  // repositories
  static const String lastDateDefault = "never";
  static const String basePathRepositories = "data";
  static const String imagesPathRepositories =
      "$basePathRepositories/$imagesUrlsFieldNameStatisticScreen";
  static const String timePathRepositories =
      "$basePathRepositories/$timeFieldNameStatisticScreen";
  static const String locationDataFileName = "locations_data";
  static const String locationDataLatFieldName = "latitude";
  static const String locationDataLngFieldName = "longitude";

  static String locationDataFieldName(index) => "location_data_$index";
}
