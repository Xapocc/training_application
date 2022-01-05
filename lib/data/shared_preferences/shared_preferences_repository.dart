import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';

abstract class SharedPreferencesRepository {
  // time

  static Future<void> saveTimeToFile(int time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(AppStrings.timeFieldNameStatisticScreen, time);
  }

  static Future<int> getTimeFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(AppStrings.timeFieldNameStatisticScreen) ??
        AppSizes.parserExReplacerTextFieldTask4Screen;
  }

  // data/error state counters

  static Future<void> incrementDataStateCounterInFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter =
        prefs.getInt(AppStrings.dataStateFieldNameStatisticScreen) ?? 0;

    await prefs.setInt(
        AppStrings.dataStateFieldNameStatisticScreen, counter + 1);
  }

  static Future<void> incrementErrorStateCounterInFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter =
        prefs.getInt(AppStrings.errorStateFieldNameStatisticScreen) ?? 0;

    await prefs.setInt(
        AppStrings.errorStateFieldNameStatisticScreen, counter + 1);
  }

  static Future<int> getDataStateCounterFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(AppStrings.dataStateFieldNameStatisticScreen) ?? 0;
  }

  static Future<int> getErrorStateCounterFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(AppStrings.errorStateFieldNameStatisticScreen) ?? 0;
  }

  static Future<Map<String, dynamic>> getStateCountersMapFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> map = <String, dynamic>{
      AppStrings.dataStateFieldNameStatisticScreen:
          prefs.getInt(AppStrings.dataStateFieldNameStatisticScreen) ?? 0,
      AppStrings.errorStateFieldNameStatisticScreen:
          prefs.getInt(AppStrings.errorStateFieldNameStatisticScreen) ?? 0,
    };

    return map;
  }
}
