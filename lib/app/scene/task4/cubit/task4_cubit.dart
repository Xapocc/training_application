import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';
import 'package:training_application/main.dart';

class Task4ScreenCubit extends Cubit<Task4ScreenState> {
  Task4ScreenCubit()
      : super(const EnabledButtonState(
            AppSizes.parserExReplacerTextFieldTask4Screen));

  static void saveTime(int time) {
    Task4TimerUseCase.saveTime(task4OfflineRepository, time);
  }

  static Future<Task4Entity> getTime() {
    return Task4TimerUseCase.getTime(task4OfflineRepository);
  }

  static Future<StatisticEntity> getStateCountersMap() {
    return StatisticUseCase.getStateCountersMap(statisticOfflineRepository);
  }

  void checkIfSecondsInRange(int seconds) {
    if (seconds >= 1 && seconds <= 10) {
      emit(EnabledButtonState(seconds));
    } else {
      emit(const DisabledButtonState());
    }
  }
}
