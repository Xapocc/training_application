import 'package:equatable/equatable.dart';

abstract class Task4ScreenState extends Equatable {
  const Task4ScreenState();
}

class EnabledButtonState extends Task4ScreenState {
  const EnabledButtonState();

  @override
  List<Object?> get props => [];
}

class DisabledButtonState extends Task4ScreenState {
  const DisabledButtonState();

  @override
  List<Object?> get props => [];
}
