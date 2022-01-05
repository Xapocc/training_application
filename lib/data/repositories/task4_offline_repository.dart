import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/task4_model.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/repositories/task4_repository_interface.dart';

class Task4OfflineRepository implements ITask4Repository {

  // get

  @override
  Future<Task4Entity> getTimeFromFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return Task4Entity.fromModel(Task4Model(
        time: prefs.getInt(AppStrings.timeFieldNameStatisticScreen) ??
            AppSizes.parserExReplacerTextFieldTask4Screen));
  }

  // set

  @override
  Future<void> saveTimeToFile(int time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(AppStrings.timeFieldNameStatisticScreen, time);
  }
}