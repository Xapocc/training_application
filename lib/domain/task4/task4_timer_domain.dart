import 'package:training_application/data/shared_preferences/shared_preferences_repository.dart';

abstract class Task4TimerDomain {
  static void saveTime(int time) {
    SharedPreferencesRepository.saveTimeToFile(time);
  }

  static Future<int> getTime() {
    return SharedPreferencesRepository.getTimeFromFile();
  }
}
