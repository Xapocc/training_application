import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/task4_model.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/mappers/task4_mapper.dart';
import 'package:training_application/domain/repositories/task4_repository_interface.dart';

class Task4OfflineRepositoryImpl implements ITask4Repository {
  // get

  @override
  Future<Task4Entity> getTimeFromFile(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return Task4Mapper().mapTask4(Task4Model(
        time: prefs.getInt(AppStrings.timeFieldNameStatisticScreen) ??
            AppSizes.parserExReplacerTextFieldTask4Screen));
  }

  // set

  @override
  Future<void> saveTimeToFile(int time, String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(AppStrings.timeFieldNameStatisticScreen, time);
  }
}
