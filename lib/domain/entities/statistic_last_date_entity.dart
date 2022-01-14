import 'package:training_application/data/models/statistic_last_date_model.dart';

class StatisticLastDateEntity {
  final int dataStateLastDate;
  final int errorStateLastDate;

  StatisticLastDateEntity(
      {required this.dataStateLastDate, required this.errorStateLastDate});

  factory StatisticLastDateEntity.fromModel(
      StatisticLastDateModel statisticLastDateModel) {
    return StatisticLastDateEntity(
        dataStateLastDate: statisticLastDateModel.dataStateLastDate,
        errorStateLastDate: statisticLastDateModel.errorStateLastDate);
  }
}
