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
  @override
  List<Object?> get props => [];
}

class ErrorState extends StatisticScreenState {
  @override
  List<Object?> get props => [];
}
