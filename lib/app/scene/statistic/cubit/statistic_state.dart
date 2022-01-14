import 'package:equatable/equatable.dart';

abstract class StatisticScreenState extends Equatable {}

class TimerState extends StatisticScreenState {
  TimerState(int time)
      : _time = time,
        super();

  final int _time;

  int get time => _time;

  @override
  List<Object?> get props => [_time];
}

class DataState extends StatisticScreenState {
  DataState(imagesUrls)
      : _imagesUrls = imagesUrls,
        super();

  final List<String> _imagesUrls;

  List<String> get imagesUrls => _imagesUrls;

  @override
  List<Object?> get props => [_imagesUrls];
}

class ErrorState extends StatisticScreenState {
  @override
  List<Object?> get props => [];
}
