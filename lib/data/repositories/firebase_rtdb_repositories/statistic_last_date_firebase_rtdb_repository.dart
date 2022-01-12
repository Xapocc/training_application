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
  Future<StatisticLastDateEntity> getStateLastDatesMap() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);

    DataSnapshot dataStateLastDateSnapshot;
    try {
      dataStateLastDateSnapshot = await ref
          .child(AppStrings.dataStateLastDateFieldNameStatisticScreen)
          .get()
          .timeout(const Duration(
              milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultDataStateLastDate();

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
      setDefaultErrorStateLastDate();

      errorStateLastDateSnapshot = await ref
          .child(AppStrings.errorStateLastDateFieldNameStatisticScreen)
          .get();
    }

    return StatisticLastDateMapper().mapStatistic(StatisticLastDateModel(
      dataStateLastDate: (dataStateLastDateSnapshot.exists
              ? dataStateLastDateSnapshot.value
              : AppStrings.lastDateDefault)
          .toString(),
      errorStateLastDate: (errorStateLastDateSnapshot.exists
              ? errorStateLastDateSnapshot.value
              : AppStrings.lastDateDefault)
          .toString(),
    ));
  }

  @override
  Future<void> saveNewDataStateLastDate() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);
    DateTime now = DateTime.now();

    await ref.update({
      AppStrings.dataStateLastDateFieldNameStatisticScreen:
          "${now.day}.${now.month}.${now.year}",
    });
  }

  @override
  Future<void> saveNewErrorStateLastDate() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);
    DateTime now = DateTime.now();

    await ref.update({
      AppStrings.errorStateLastDateFieldNameStatisticScreen:
          "${now.day}.${now.month}.${now.year}",
    });
  }

  Future<void> setDefaultDataStateLastDate() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);

    await ref.update({
      AppStrings.dataStateLastDateFieldNameStatisticScreen: "never",
    });
  }

  Future<void> setDefaultErrorStateLastDate() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);

    await ref.update({
      AppStrings.errorStateLastDateFieldNameStatisticScreen: "never",
    });
  }
}
