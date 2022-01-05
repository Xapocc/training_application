import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/statistic_model.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/repositories/statistic_repository_interface.dart';

class StatisticOfflineRepositoryImpl implements IStatisticRepository {
  // get

  @override
  Future<StatisticEntity> getStateCountersMapFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return StatisticEntity.fromModel(StatisticModel(
        dataStateCounter:
            prefs.getInt(AppStrings.dataStateFieldNameStatisticScreen) ?? 0,
        errorStateCounter:
            prefs.getInt(AppStrings.errorStateFieldNameStatisticScreen) ?? 0));
  }

  // set

  @override
  Future<void> incrementDataStateCounterInFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter =
        prefs.getInt(AppStrings.dataStateFieldNameStatisticScreen) ?? 0;

    await prefs.setInt(
        AppStrings.dataStateFieldNameStatisticScreen, counter + 1);
  }

  @override
  Future<void> incrementErrorStateCounterInFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter =
        prefs.getInt(AppStrings.errorStateFieldNameStatisticScreen) ?? 0;

    await prefs.setInt(
        AppStrings.errorStateFieldNameStatisticScreen, counter + 1);
  }
}
