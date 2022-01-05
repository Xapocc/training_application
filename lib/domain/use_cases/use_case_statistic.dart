import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/repositories/statistic_repository_interface.dart';

class StatisticUseCase {
  StatisticUseCase({required this.repository});

  final IStatisticRepository repository;

  // get

  Future<StatisticEntity> getStateCountersMap() {
    return repository.getStateCountersMapFromFile();
  }

  // set

  void incrementDataStateCounter() {
    repository.incrementDataStateCounterInFile();
  }

  void incrementErrorStateCounter() {
    repository.incrementErrorStateCounterInFile();
  }
}
