import 'package:training_application/data/shared_preferences/shared_preferences_repository.dart';

abstract class StatisticDomain {
  static Future<int> getDataStateCounter() {
    return SharedPreferencesRepository.getDataStateCounterFromFile();
  }

  static Future<int> getErrorStateCounter() {
    return SharedPreferencesRepository.getErrorStateCounterFromFile();
  }

  static Future<Map<String, dynamic>> getStateCountersMap() {
    return SharedPreferencesRepository.getStateCountersMapFromFile();
  }

  static void incrementDataStateCounter() {
    SharedPreferencesRepository.incrementDataStateCounterInFile();
  }

  static void incrementErrorStateCounter() {
    SharedPreferencesRepository.incrementErrorStateCounterInFile();
  }
}
