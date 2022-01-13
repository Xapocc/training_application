import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/domain/entities/image_url_entity.dart';
import 'package:training_application/main.dart';

class StatisticScreenCubit extends Cubit<StatisticScreenState> {
  late StreamController _controllerCounter;
  late StreamController _controllerLastDate;
  StreamSubscription? _subscriptionCounter;
  StreamSubscription? _subscriptionLastDate;

  StatisticScreenCubit(int seconds) : super(TimerState(seconds)) {
    _controllerCounter = StreamController<int>();
    _controllerLastDate = StreamController<String>();

    startTimer();
  }

  Future<List<ImageUrlEntity>> getImageUrls() {
    return imageUrlsUseCase!.getImageUls();
  }

  Future<void> getStateCountersMapStream(stateType) async {
    if (stateType is DataState) {
      _controllerCounter.add(
          (await statisticUseCase!.getStateCountersMap()).dataStateCounter);
    } else {
      _controllerCounter.add(
          (await statisticUseCase!.getStateCountersMap()).errorStateCounter);
    }
  }

  Future<void> getStateLastDateMapStream(stateType) async {
    if (stateType is DataState) {
      _controllerLastDate.add(
          (await statisticLastDateUseCase!.getStateLastDatesMap())
              .dataStateLastDate);
    } else {
      _controllerLastDate.add(
          (await statisticLastDateUseCase!.getStateLastDatesMap())
              .errorStateLastDate);
    }
  }

  void startTimer() async {
    while ((state as TimerState).time > 0) {
      await Future.delayed(const Duration(seconds: 1));
      emit(TimerState((state as TimerState).time - 1));
    }

    if ((state as TimerState).time == 0) {
      var rnd = Random();

      // data state
      if (rnd.nextInt(99) % 2 == 0) {
        statisticUseCase!.incrementDataStateCounter();

        List<ImageUrlEntity> imageUrlsEntities = await getImageUrls();
        List<String> imageUrlsStrings = List.empty(growable: true);
        for (ImageUrlEntity item in imageUrlsEntities) {
          imageUrlsStrings.add(item.url);
        }

        _subscriptionCounter = _controllerCounter.stream.listen((event) {
          emit(DataState((state as DataState).imagesUrls, event,
              (state as DataState).lastDate));
          _subscriptionCounter?.cancel();
        });
        _subscriptionLastDate = _controllerLastDate.stream.listen((event) {
          emit(DataState((state as DataState).imagesUrls,
              (state as DataState).counter, event));
          _subscriptionLastDate?.cancel();
        });

        statisticLastDateUseCase!.saveNewDataStateDate();
        emit(DataState(imageUrlsStrings));
        // error state
      } else {
        _subscriptionCounter = _controllerCounter.stream.listen((event) {
          emit(ErrorState(event, (state as ErrorState).lastDate));
          _subscriptionCounter?.cancel();
        });
        _subscriptionLastDate = _controllerLastDate.stream.listen((event) {
          emit(ErrorState((state as ErrorState).counter, event));
          _subscriptionLastDate?.cancel();
        });

        statisticUseCase!.incrementErrorStateCounter();
        statisticLastDateUseCase!.saveNewErrorStateDate();
        emit(ErrorState());
      }
    }
  }
}
