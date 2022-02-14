import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/repositories/statistic_repository_interface.dart';

class StatisticUseCase {
  StatisticUseCase({required this.repository});

  final IStatisticRepository repository;

  // get

  Future<StatisticEntity> getStateCountersMap(String userId) {
    return repository.getStateCountersMapFromFile(userId);
  }

  // set

  void incrementDataStateCounter(String userId) {
    repository.incrementDataStateCounterInFile(userId);
  }

  void incrementErrorStateCounter(String userId) {
    repository.incrementErrorStateCounterInFile(userId);
  }
}
