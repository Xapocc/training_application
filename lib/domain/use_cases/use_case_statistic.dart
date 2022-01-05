import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/repositories/statistic_repository_interface.dart';

abstract class StatisticUseCase {
  // get

  static Future<StatisticEntity> getStateCountersMap(IStatisticRepository repository) {
    return repository.getStateCountersMapFromFile();
  }

  // set

  static void incrementDataStateCounter(IStatisticRepository repository) {
    repository.incrementDataStateCounterInFile();
  }

  static void incrementErrorStateCounter(IStatisticRepository repository) {
    repository.incrementErrorStateCounterInFile();
  }
}