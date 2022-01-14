import 'package:training_application/data/models/task4_model.dart';
import 'package:training_application/domain/entities/task4_entity.dart';

class Task4Mapper {
  Task4Entity mapTask4(Task4Model task4model) =>
      Task4Entity(time: task4model.time);
}
