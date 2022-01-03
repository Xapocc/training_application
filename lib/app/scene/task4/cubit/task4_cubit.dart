import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';

class Task4ScreenCubit extends Cubit<Task4ScreenState> {
  Task4ScreenCubit()
      : super(const EnabledButtonState(
            AppSizes.parserExReplacerTextFieldTask4Screen));

  void checkIfSecondsInRange(int seconds) {
    if (seconds >= 1 && seconds <= 10) {
      emit(EnabledButtonState(seconds));
    } else {
      emit(const DisabledButtonState());
    }
  }
}
