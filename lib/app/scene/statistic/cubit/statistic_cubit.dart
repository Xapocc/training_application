import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/domain/statistic/statistic_domain.dart';

class StatisticScreenCubit extends Cubit<StatisticScreenState> {
  StatisticScreenCubit(int seconds) : super(TimerState(seconds)) {
    if (StatisticScreenState.images.isNotEmpty) {
      StatisticScreenState.images
          .removeRange(0, StatisticScreenState.images.length);
    }

    for (String item in StatisticScreenState.imagesUrls) {
      StatisticScreenState.images.add(Image.network(item));
    }

    startTimer();
  }

  static Future<Map<String, dynamic>> getStateCountersMap() {
    return StatisticDomain.getStateCountersMap();
  }

  void startTimer() async {
    while ((state as TimerState).time > 0) {
      await Future.delayed(const Duration(seconds: 1));
      emit(TimerState((state as TimerState).time - 1));
    }

    if ((state as TimerState).time == 0) {
      var rnd = Random();

      if (rnd.nextInt(99) % 2 == 0) {
        StatisticDomain.incrementDataStateCounter();
        emit(DataState());
      } else {
        StatisticDomain.incrementErrorStateCounter();
        emit(ErrorState());
      }
    }
  }
}
