import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/repositories/task4_repository_interface.dart';

class Task4TimerUseCase {
  Task4TimerUseCase({required this.repository});

  final ITask4Repository repository;

  // get

  Future<Task4Entity> getTime(String userId) {
    return repository.getTimeFromFile(userId);
  }

  // set

  void saveTime(int time, String userId) {
    repository.saveTimeToFile(time, userId);
  }
}
