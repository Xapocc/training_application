import 'package:training_application/domain/entities/statistic_entity.dart';

abstract class IStatisticRepository {
  // get

  Future<StatisticEntity> getStateCountersMapFromFile(String userId);

  //set

  Future<void> incrementDataStateCounterInFile(String userId);

  Future<void> incrementErrorStateCounterInFile(String userId);
}
