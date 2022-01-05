import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/main.dart';

class StatisticScreenCubit extends Cubit<StatisticScreenState> {
  StatisticScreenCubit(int seconds) : super(TimerState(seconds)) {
    imagesUrls = imageUrlsUseCase.getImageUls().urls;

    if (images.isNotEmpty) {
      images.removeRange(0, images.length);
    }

    for (String item in imagesUrls) {
      images.add(Image.network(item));
    }

    startTimer();
  }

  List<String> imagesUrls = List<String>.empty(growable: true);
  final List<Image> _images = List<Image>.empty(growable: true);

  List<Image> get images => _images;

  Future<StatisticEntity> getStateCountersMap() {
    return statisticUseCase.getStateCountersMap();
  }

  void startTimer() async {
    while ((state as TimerState).time > 0) {
      await Future.delayed(const Duration(seconds: 1));
      emit(TimerState((state as TimerState).time - 1));
    }

    if ((state as TimerState).time == 0) {
      var rnd = Random();

      if (rnd.nextInt(99) % 2 == 0) {
        statisticUseCase.incrementDataStateCounter();
        emit(DataState());
      } else {
        statisticUseCase.incrementErrorStateCounter();
        emit(ErrorState());
      }
    }
  }
}
