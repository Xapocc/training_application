import 'package:training_application/domain/entities/statistic_last_date_entity.dart';
import 'package:training_application/domain/repositories/statistic_last_date_repository_interface.dart';

class StatisticLastDateUseCase {
  StatisticLastDateUseCase({required this.repository});

  final IStatisticLastDateRepository repository;

  // get

  Future<StatisticLastDateEntity> getStateLastDatesMap() {
    return repository.getStateLastDatesMap();
  }

  // set

  void saveNewDataStateDate() {
    repository.saveNewDataStateLastDate();
  }

  void saveNewErrorStateDate() {
    repository.saveNewErrorStateLastDate();
  }
}
