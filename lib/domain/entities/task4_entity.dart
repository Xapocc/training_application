import 'package:training_application/data/models/task4_model.dart';

class Task4Entity {
  int time;

  Task4Entity({required this.time});

  factory Task4Entity.fromModel(Task4Model task4model) {
    return Task4Entity(time: task4model.time);
  }
}
