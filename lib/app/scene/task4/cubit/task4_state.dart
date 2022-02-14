import 'package:equatable/equatable.dart';

class Task4ScreenState extends Equatable {
  const Task4ScreenState({
    bool isButtonEnabled = false,
    int seconds = 0,
    int secondsStart = 0,
  })  : _isButtonEnabled = isButtonEnabled,
        _seconds = seconds,
        _secondsStart = secondsStart,
        super();

  Task4ScreenState.fromState(
    Task4ScreenState state, {
    bool? isButtonEnabled,
    int? seconds,
    int? secondsStart,
  })  : _isButtonEnabled = isButtonEnabled ?? state.isButtonEnabled,
        _seconds = seconds ?? state.seconds,
        _secondsStart = secondsStart ?? state.secondsStart,
        super();

  final bool _isButtonEnabled;
  final int _seconds;
  final int _secondsStart;

  bool get isButtonEnabled => _isButtonEnabled;

  int get seconds => _seconds;

  int get secondsStart => _secondsStart;

  @override
  List<Object?> get props => [
        _isButtonEnabled,
        _seconds,
        _secondsStart,
      ];
}
