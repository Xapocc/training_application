abstract class AppStrings {
  static const String apiKeyGoogleMaps =
      "AIzaSyAHPZ12iDgKw6cAjz88u2OlCDNNtedWBpY";

  // task 3 screen

  // task 4 screen
  static const String formatLastDate = 'dd MMM yyyy';

  // statistic screen
  static const String timeFieldNameStatisticScreen = "time";
  static const String dataStateFieldNameStatisticScreen = "dataStateCounter";
  static const String errorStateFieldNameStatisticScreen = "errorStateCounter";
  static const String dataStateLastDateFieldNameStatisticScreen =
      "dataStateLastDate";
  static const String errorStateLastDateFieldNameStatisticScreen =
      "errorStateLastDate";
  static const String imagesUrlsFieldNameStatisticScreen = "imagesUrls";

  // gps path map screen
  static const String latitudeFullGpsPathMapScreen = "latitude";
  static const String longitudeFullGpsPathMapScreen = "longitude";
  static const String latitudeShortGpsPathMapScreen = "lat";
  static const String longitudeShortGpsPathMapScreen = "lng";
  static const String markerIdGpsPathMapScreen = "end";
  static const String polylineIdGpsPathMapScreen = "path";

  static String indexColumnListViewItemGpsPathMapScreen(index) =>
      "${index + 1}. ";

  static String dataColumnListViewItemGpsPathMapScreen(
          String fieldName, double? value) =>
      "$fieldName. $value";

  static String circleIdGpsPathMapScreen(int index) => "circle_$index";

  // repositories
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
