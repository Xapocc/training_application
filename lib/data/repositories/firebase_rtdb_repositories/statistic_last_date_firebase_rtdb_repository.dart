import 'package:firebase_database/firebase_database.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/statistic_last_date_model.dart';
import 'package:training_application/domain/entities/statistic_last_date_entity.dart';
import 'package:training_application/domain/mappers/statistic_last_date_mapper.dart';
import 'package:training_application/domain/repositories/statistic_last_date_repository_interface.dart';
import 'package:training_application/main.dart';

class StatisticLastDateFirebaseRepositoryImpl
    implements IStatisticLastDateRepository {
  @override
  Future<StatisticLastDateEntity> getStateLastDatesMap(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    DataSnapshot dataStateLastDateSnapshot;
    try {
      dataStateLastDateSnapshot = await ref
          .child(AppStrings.dataStateLastDateFieldNameStatisticScreen)
          .get()
          .timeout(const Duration(
              milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultDataStateLastDate(userId);

      dataStateLastDateSnapshot = await ref
          .child(AppStrings.dataStateLastDateFieldNameStatisticScreen)
          .get();
    }

    DataSnapshot errorStateLastDateSnapshot;
    try {
      errorStateLastDateSnapshot = await ref
          .child(AppStrings.errorStateLastDateFieldNameStatisticScreen)
          .get()
          .timeout(const Duration(
              milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultErrorStateLastDate(userId);

      errorStateLastDateSnapshot = await ref
          .child(AppStrings.errorStateLastDateFieldNameStatisticScreen)
          .get();
    }

    return StatisticLastDateMapper().mapStatistic(StatisticLastDateModel(
      dataStateLastDate: dataStateLastDateSnapshot.exists
          ? int.parse((dataStateLastDateSnapshot.value).toString())
          : 0,
      errorStateLastDate: errorStateLastDateSnapshot.exists
          ? int.parse((errorStateLastDateSnapshot.value).toString())
          : 0,
    ));
  }

  Future<void> saveNewStateLastDate(bool isDataState, String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);
    DateTime now = DateTime.now();

    await ref.update({
      (isDataState
              ? AppStrings.dataStateLastDateFieldNameStatisticScreen
              : AppStrings.errorStateLastDateFieldNameStatisticScreen):
          now.millisecondsSinceEpoch,
    });
  }

  @override
  Future<void> saveNewDataStateLastDate(String userId) async {
    saveNewStateLastDate(true, userId);
  }

  @override
  Future<void> saveNewErrorStateLastDate(String userId) async {
    saveNewStateLastDate(false, userId);
  }

  Future<void> setDefaultDataStateLastDate(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.dataStateLastDateFieldNameStatisticScreen:
          AppSizes.lastDateDefaultMilliseconds,
    });
  }

  Future<void> setDefaultErrorStateLastDate(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.errorStateLastDateFieldNameStatisticScreen:
          AppSizes.lastDateDefaultMilliseconds,
    });
  }
}
