import 'package:training_application/domain/entities/task4_entity.dart';

abstract class ITask4Repository {
  // get

  Future<Task4Entity> getTimeFromFile(String userId);

  // set

  Future<void> saveTimeToFile(int time, String userId);
}
