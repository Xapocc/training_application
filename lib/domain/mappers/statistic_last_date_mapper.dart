import 'package:training_application/data/models/statistic_last_date_model.dart';
import 'package:training_application/domain/entities/statistic_last_date_entity.dart';

class StatisticLastDateMapper {
  StatisticLastDateEntity mapStatistic(StatisticLastDateModel statisticModel) =>
      StatisticLastDateEntity(
          dataStateLastDate: statisticModel.dataStateLastDate,
          errorStateLastDate: statisticModel.errorStateLastDate);
}
