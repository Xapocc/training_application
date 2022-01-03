import 'package:equatable/equatable.dart';

abstract class Task4ScreenState extends Equatable {
  const Task4ScreenState();
}

class EnabledButtonState extends Task4ScreenState {
  const EnabledButtonState(int seconds)
      : _seconds = seconds,
        super();

  final int _seconds;

  @override
  List<Object?> get props => [_seconds];
}

class DisabledButtonState extends Task4ScreenState {
  const DisabledButtonState();

  @override
  List<Object?> get props => [];
}
