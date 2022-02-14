import 'package:firebase_database/firebase_database.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/data/models/task4_model.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/mappers/task4_mapper.dart';
import 'package:training_application/domain/repositories/task4_repository_interface.dart';
import 'package:training_application/main.dart';

class Task4FirebaseRepositoryImpl implements ITask4Repository {
  // get

  @override
  Future<Task4Entity> getTimeFromFile(String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.timePathRepositories + userId);

    DataSnapshot snapshot;

    try {
      snapshot = await ref.get().timeout(const Duration(
          milliseconds: AppSizes.millisecondsTimeoutDurationFirebaseRtdb));
    } catch (ex) {
      setDefaultTime();

      snapshot = await ref.get();
    }

    int value = int.parse((snapshot.exists
            ? snapshot.value
            : AppSizes.parserExReplacerTextFieldTask4Screen)
        .toString());

    return Task4Mapper().mapTask4(Task4Model(time: value));
  }

  // set

  @override
  Future<void> saveTimeToFile(int time, String userId) async {
    DatabaseReference ref =
        database!.ref(AppStrings.basePathRepositories + userId);

    await ref.update({
      AppStrings.timeFieldNameStatisticScreen: time,
    });
  }

  Future<void> setDefaultTime() async {
    DatabaseReference ref = database!.ref(AppStrings.basePathRepositories);

    await ref.update({
      AppStrings.timeFieldNameStatisticScreen:
          AppSizes.parserExReplacerTextFieldTask4Screen,
    });
  }
}
