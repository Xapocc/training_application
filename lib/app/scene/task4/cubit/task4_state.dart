import 'package:equatable/equatable.dart';

abstract class Task4ScreenState extends Equatable {}

class InputTimeState extends Task4ScreenState {
  @override
  List<Object?> get props => [];
}

class TimerState extends Task4ScreenState {
  TimerState(int time)
      : _time = time,
        super();

  final int _time;

  int get time => _time;

  @override
  List<Object?> get props => [_time];
}

class DataState extends Task4ScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends Task4ScreenState {
  @override
  List<Object?> get props => [];
}
