import 'package:training_application/data/models/statistic_model.dart';

class StatisticEntity {
  final int dataStateCounter;
  final int errorStateCounter;

  StatisticEntity(
      {required this.dataStateCounter, required this.errorStateCounter});

  factory StatisticEntity.fromModel(StatisticModel statisticModel) {
    return StatisticEntity(
        dataStateCounter: statisticModel.dataStateCounter,
        errorStateCounter: statisticModel.errorStateCounter);
  }
}
