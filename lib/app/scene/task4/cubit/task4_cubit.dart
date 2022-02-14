import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/main.dart';

class Task4ScreenCubit extends Cubit<Task4ScreenState> {
  late StreamController _controllerTime;

  StreamSubscription? _subscriptionTime;

  Task4ScreenCubit() : super(const Task4ScreenState(isButtonEnabled: false)) {
    _controllerTime = StreamController<Task4Entity>();

    _subscriptionTime = _controllerTime.stream.listen((event) {
      emit(Task4ScreenState.fromState(state,
          secondsStart: (event as Task4Entity).time));
      checkIfSecondsInRange(event.time);

      _subscriptionTime?.cancel();
    });

    getTime();
  }

  void saveTime(int time) {
    task4TimerUseCase!.saveTime(time, auth?.currentUser?.uid ?? "");
  }

  Future<void> getTime() async {
    _controllerTime
        .add(await task4TimerUseCase!.getTime(auth?.currentUser?.uid ?? ""));
  }

  void checkIfSecondsInRange(int seconds) {
    emit(Task4ScreenState.fromState(state,
        isButtonEnabled: (seconds >= AppSizes.secondsMinAllowedTask4Screen &&
            seconds <= AppSizes.secondsMaxAllowedTask4Screen),
        seconds: seconds));
  }
}
