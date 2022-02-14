import 'package:firebase_database/firebase_database.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/statistic_model.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/mappers/statistic_mapper.dart';
import 'package:training_application/domain/repositories/statistic_repository_interface.dart';
import 'package:training_application/main.dart';

class StatisticFirebaseRepositoryImpl implements IStatisticRepository {
  // get

  @override
  Future<StatisticEntity> getStateCountersMapFromFile(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    DataSnapshot dataStateSnapshot;
    try {
      dataStateSnapshot = await ref
          .child(AppStrings.dataStateFieldNameStatisticScreen)
          .get()
          .timeout(const Duration(
              milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultDataStateCounter(userId);

      dataStateSnapshot =
          await ref.child(AppStrings.dataStateFieldNameStatisticScreen).get();
    }

    DataSnapshot errorStateSnapshot;
    try {
      errorStateSnapshot = await ref
          .child(AppStrings.errorStateFieldNameStatisticScreen)
          .get()
          .timeout(const Duration(
              milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultErrorStateCounter(userId);

      errorStateSnapshot =
          await ref.child(AppStrings.errorStateFieldNameStatisticScreen).get();
    }

    return StatisticMapper().mapStatistic(StatisticModel(
      dataStateCounter: int.parse((dataStateSnapshot.exists
              ? dataStateSnapshot.value
              : AppSizes.defaultCounterValueStatisticScreen)
          .toString()),
      errorStateCounter: int.parse((errorStateSnapshot.exists
              ? errorStateSnapshot.value
              : AppSizes.defaultCounterValueStatisticScreen)
          .toString()),
    ));
  }

  // set

  @override
  Future<void> incrementDataStateCounterInFile(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.dataStateFieldNameStatisticScreen: ServerValue.increment(1),
    });
  }

  @override
  Future<void> incrementErrorStateCounterInFile(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.errorStateFieldNameStatisticScreen: ServerValue.increment(1),
    });
  }

  Future<void> setDefaultDataStateCounter(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.dataStateFieldNameStatisticScreen:
          AppSizes.defaultCounterValueStatisticScreen,
    });
  }

  Future<void> setDefaultErrorStateCounter(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.errorStateFieldNameStatisticScreen:
          AppSizes.defaultCounterValueStatisticScreen,
    });
  }
}
