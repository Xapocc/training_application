import 'package:training_application/data/statistic/statistic_offline_repository.dart';

abstract class StatisticDomain {
  static Future<int> getDataStateCounter() {
    return StatisticOfflineRepository.getDataStateCounterFromFile();
  }

  static Future<int> getErrorStateCounter() {
    return StatisticOfflineRepository.getErrorStateCounterFromFile();
  }

  static Future<Map<String, dynamic>> getStateCountersMap() {
    return StatisticOfflineRepository.getStateCountersMapFromFile();
  }

  static void incrementDataStateCounter() {
    StatisticOfflineRepository.incrementDataStateCounterInFile();
  }

  static void incrementErrorStateCounter() {
    StatisticOfflineRepository.incrementErrorStateCounterInFile();
  }
}
