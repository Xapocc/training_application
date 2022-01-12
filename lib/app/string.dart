abstract class AppStrings {
  // errors
  static const String errorMessageTest =
      "some long error text with a lot of symbols and words for testing your error screen as it should display every error`s message despite how long it is";

  // choose screen
  static const String textButton0ChooseScreen = "Task 3 Screen";
  static const String textButton1ChooseScreen = "Task 4 Screen";

  // task 4 screen
  static const String textButtonStartTimerTask4Screen = "Start";
  static const String textHintDefaultTask4Screen = "1";

  static String stateCountersTextTask4Screen(counter, hasData) =>
      "${hasData ? "Data" : "Error"} state\nappeared $counter time${counter == 1 ? "" : "s"}";

  static String stateLastDateTextTask4Screen(date, hasData) =>
      "Last ${hasData ? "data" : "error"} state\nappearance date\nis $date";

  // statistic screen
  static String spinnerTextStatisticScreen(time) =>
      "Please wait $time second${time == 1 ? "" : "s"}";

  static String stateCountersTextStatisticScreen(counter, hasData) =>
      "${hasData ? "Data" : "Error"} state appeared $counter time${counter == 1 ? "" : "s"} now";

  static String stateLastDateTextStatisticScreen(lastDate) =>
      "\nLast appearance date is $lastDate";
  static const String timeFieldNameStatisticScreen = "time";
  static const String dataStateFieldNameStatisticScreen = "dataStateCounter";
  static const String errorStateFieldNameStatisticScreen = "errorStateCounter";
  static const String dataStateLastDateFieldNameStatisticScreen =
      "dataStateLastDate";
  static const String errorStateLastDateFieldNameStatisticScreen =
      "errorStateLastDate";
  static const String imagesUrlsFieldNameStatisticScreen = "imagesUrls";

  // repositories
  static const String lastDateDefault = "never";
  static const String basePathRepositories = "data";
  static const String imagesPathRepositories =
      "$basePathRepositories/$imagesUrlsFieldNameStatisticScreen";
  static const String timePathRepositories =
      "$basePathRepositories/$timeFieldNameStatisticScreen";
}
