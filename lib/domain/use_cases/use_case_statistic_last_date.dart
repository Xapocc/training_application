import 'package:training_application/domain/entities/statistic_last_date_entity.dart';
import 'package:training_application/domain/repositories/statistic_last_date_repository_interface.dart';

class StatisticLastDateUseCase {
  StatisticLastDateUseCase({required this.repository});

  final IStatisticLastDateRepository repository;

  // get

  Future<StatisticLastDateEntity> getStateLastDatesMap(String userId) {
    return repository.getStateLastDatesMap(userId);
  }

  // set

  void saveNewDataStateDate(String userId) {
    repository.saveNewDataStateLastDate(userId);
  }

  void saveNewErrorStateDate(String userId) {
    repository.saveNewErrorStateLastDate(userId);
  }
}
