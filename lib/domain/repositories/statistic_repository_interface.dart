import 'package:training_application/domain/entities/statistic_entity.dart';

abstract class IStatisticRepository {
  // get

  Future<StatisticEntity> getStateCountersMapFromFile();

  //set

  Future<void> incrementDataStateCounterInFile();

  Future<void> incrementErrorStateCounterInFile();
}
