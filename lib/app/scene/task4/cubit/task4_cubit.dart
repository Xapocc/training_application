import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/entities/statistic_last_date_entity.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/main.dart';

class Task4ScreenCubit extends Cubit<Task4ScreenState> {
  late StreamController _controllerTime;
  late StreamController _controllerCounter;
  late StreamController _controllerLastDate;

  StreamSubscription? _subscriptionTime;
  StreamSubscription? _subscriptionCounter;
  StreamSubscription? _subscriptionLastDate;

  Task4ScreenCubit() : super(const Task4ScreenState(isButtonEnabled: false)) {
    _controllerTime = StreamController<Task4Entity>();
    _controllerCounter = StreamController<StatisticEntity>();
    _controllerLastDate = StreamController<StatisticLastDateEntity>();

    _subscriptionTime = _controllerTime.stream.listen((event) {
      emit(Task4ScreenState.fromState(state,
          secondsStart: (event as Task4Entity).time));
      checkIfSecondsInRange(event.time);

      _subscriptionTime?.cancel();
    });

    _subscriptionCounter = _controllerCounter.stream.listen((event) {
      emit(Task4ScreenState.fromState(state,
          dataStateCounter: (event as StatisticEntity).dataStateCounter,
          errorStateCounter: event.errorStateCounter));

      _subscriptionCounter?.cancel();
    });

    _subscriptionLastDate = _controllerLastDate.stream.listen((event) {
      emit(Task4ScreenState.fromState(state,
          dataStateLastDate:
              (event as StatisticLastDateEntity).dataStateLastDate,
          errorStateLastDate: event.errorStateLastDate));

      _subscriptionLastDate?.cancel();
    });

    getTime();
    getStateCountersMap();
    getStateLastDateMap();
  }

  void saveTime(int time) {
    task4TimerUseCase!.saveTime(time);
  }

  Future<void> getTime() async {
    _controllerTime.add(await task4TimerUseCase!.getTime());
  }

  Future<void> getStateCountersMap() async {
    _controllerCounter.add(await statisticUseCase!.getStateCountersMap());
  }

  Future<void> getStateLastDateMap() async {
    _controllerLastDate
        .add(await statisticLastDateUseCase!.getStateLastDatesMap());
  }

  void checkIfSecondsInRange(int seconds) {
    emit(Task4ScreenState.fromState(state,
        isButtonEnabled: (seconds >= AppSizes.secondsMinAllowedTask4Screen &&
            seconds <= AppSizes.secondsMaxAllowedTask4Screen),
        seconds: seconds));
  }
}
