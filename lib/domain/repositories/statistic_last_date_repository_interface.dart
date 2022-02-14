import 'package:training_application/domain/entities/statistic_last_date_entity.dart';

abstract class IStatisticLastDateRepository {
  // get

  Future<StatisticLastDateEntity> getStateLastDatesMap(String userId);

  //set

  Future<void> saveNewDataStateLastDate(String userId);

  Future<void> saveNewErrorStateLastDate(String userId);
}
