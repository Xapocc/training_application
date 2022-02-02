import 'package:equatable/equatable.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/main.dart';

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

class PostTimerState extends StatisticScreenState {
  PostTimerState(int counter, String lastDate)
      : _counter = counter,
        _lastDate = lastDate,
        super();

  final int _counter;
  final String _lastDate;

  int get counter => _counter;

  String get lastDate => _lastDate;

  @override
  List<Object?> get props => [_counter, _lastDate];
}

class DataState extends PostTimerState {
  DataState(List<String> imagesUrls,
      [int counter = AppSizes.defaultCounterValueStatisticScreen,
      String? lastDate])
      : _imagesUrls = imagesUrls,
        super(counter, lastDate ?? l10n.lastDateDefault);

  final List<String> _imagesUrls;

  List<String> get imagesUrls => _imagesUrls;

  @override
  List<Object?> get props => [_imagesUrls, _counter, _lastDate];
}

class ErrorState extends PostTimerState {
  ErrorState(
      [int counter = AppSizes.defaultCounterValueStatisticScreen,
      String? lastDate])
      : super(counter, lastDate ?? l10n.lastDateDefault);

  @override
  List<Object?> get props => [_counter, _lastDate];
}
