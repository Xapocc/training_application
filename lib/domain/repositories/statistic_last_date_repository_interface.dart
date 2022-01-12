import 'package:training_application/domain/entities/statistic_last_date_entity.dart';

abstract class IStatisticLastDateRepository {
  // get

  Future<StatisticLastDateEntity> getStateLastDatesMap();

  //set

  Future<void> saveNewDataStateLastDate();

  Future<void> saveNewErrorStateLastDate();
}
