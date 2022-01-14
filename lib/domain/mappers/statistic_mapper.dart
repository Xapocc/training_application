import 'package:training_application/data/models/statistic_model.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';

class StatisticMapper {
  StatisticEntity mapStatistic(StatisticModel statisticModel) =>
      StatisticEntity(
          dataStateCounter: statisticModel.dataStateCounter,
          errorStateCounter: statisticModel.errorStateCounter);
}
