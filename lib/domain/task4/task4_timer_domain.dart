import 'package:training_application/data/task4/task4_offline_repository.dart';

abstract class Task4TimerDomain {
  static void saveTime(int time) {
    Task4OfflineRepository.saveTimeToFile(time);
  }

  static Future<int> getTime() {
    return Task4OfflineRepository.getTimeFromFile();
  }
}
