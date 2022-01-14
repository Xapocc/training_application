import 'package:equatable/equatable.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object?> get props => [];
}

class RouterStateSplashScreen extends RouterState {
  const RouterStateSplashScreen();

  @override
  List<Object?> get props => [];
}

class RouterStateTask3Screen extends RouterState {
  const RouterStateTask3Screen();

  @override
  List<Object?> get props => [];
}

class RouterStateChooseScreen extends RouterState {
  const RouterStateChooseScreen();

  @override
  List<Object?> get props => [];
}

class RouterStateTask4Screen extends RouterState {
  const RouterStateTask4Screen();

  @override
  List<Object?> get props => [];
}

class RouterStateStatisticScreen extends RouterState {
  const RouterStateStatisticScreen(int sec) : _seconds = sec;

  final int _seconds;
  int get seconds => _seconds;

  @override
  List<Object?> get props => [];
}

class RouterStateGpsTracker extends RouterState {
  const RouterStateGpsTracker();

  @override
  List<Object?> get props => [];
}
