import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/domain/entities/image_url_entity.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/main.dart';

class StatisticScreenCubit extends Cubit<StatisticScreenState> {
  StatisticScreenCubit(int seconds) : super(TimerState(seconds)) {
    startTimer();
  }

  Future<List<ImageUrlEntity>> getImageUrls() {
    return imageUrlsUseCase!.getImageUls();
  }

  Future<StatisticEntity> getStateCountersMap() {
    return statisticUseCase!.getStateCountersMap();
  }

  void startTimer() async {
    while ((state as TimerState).time > 0) {
      await Future.delayed(const Duration(seconds: 1));
      emit(TimerState((state as TimerState).time - 1));
    }

    if ((state as TimerState).time == 0) {
      var rnd = Random();

      if (rnd.nextInt(99) % 2 == 0) {
        statisticUseCase!.incrementDataStateCounter();

        List<ImageUrlEntity> imageUrlsEntities = await getImageUrls();
        List<String> imageUrlsStrings = List.empty(growable: true);
        for (ImageUrlEntity item in imageUrlsEntities) {
          imageUrlsStrings.add(item.url);
        }

        emit(DataState(imageUrlsStrings));
      } else {
        statisticUseCase!.incrementErrorStateCounter();
        emit(ErrorState());
      }
    }
  }
}
