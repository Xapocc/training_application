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
  static String stateCountersTextTask4Screen(counter, hasData) => "${hasData ? "Data" : "Error"} state\nappeared $counter time${counter == 1 ? "" : "s"}";


  // statistic screen
  static const List<String> imagesCatsUrls = [
    "https://unsplash.com/photos/rW-I87aPY5Y/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/gKXKBY-C-Dk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/so5nsYDOdxw/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Nnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/mJaD10XeD7w/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/OzAeZPNsLXk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/NodtnCsLdTE/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8OHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/ZCHj_2lJP00/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8N3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/nKC772R_qog/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTF8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/LEpfefQf4rU/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTR8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/75715CVEJhI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTV8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
  ];
  static String spinnerTextStatisticScreen(time) => "Please wait $time second${time == 1 ? "" : "s"}";
  static String stateCountersTextStatisticScreen(counter, hasData) => "${hasData ? "Data" : "Error"} state appeared $counter time${counter == 1 ? "" : "s"} now";
  static const String dataStateFieldNameStatisticScreen = "dataStateCounter";
  static const String errorStateFieldNameStatisticScreen = "errorStateCounter";
}
