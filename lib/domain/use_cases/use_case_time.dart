import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/repositories/task4_repository_interface.dart';

abstract class Task4TimerUseCase {
  // get

  static Future<Task4Entity> getTime(ITask4Repository repository) {
    return repository.getTimeFromFile();
  }

  // set

  static void saveTime(ITask4Repository repository, int time) {
    repository.saveTimeToFile(time);
  }
}
