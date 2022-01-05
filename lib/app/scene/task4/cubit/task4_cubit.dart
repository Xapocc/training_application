import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/statistic/statistic_domain.dart';
import 'package:training_application/domain/task4/task4_timer_domain.dart';

class Task4ScreenCubit extends Cubit<Task4ScreenState> {
  Task4ScreenCubit()
      : super(const EnabledButtonState(
            AppSizes.parserExReplacerTextFieldTask4Screen));

  static void saveTime(int time) {
    Task4TimerDomain.saveTime(time);
  }

  static Future<int> getTime() {
    return Task4TimerDomain.getTime();
  }

  static Future<Map<String, dynamic>> getStateCountersMap() {
    return StatisticDomain.getStateCountersMap();
  }

  void checkIfSecondsInRange(int seconds) {
    if (seconds >= 1 && seconds <= 10) {
      emit(EnabledButtonState(seconds));
    } else {
      emit(const DisabledButtonState());
    }
  }
}
