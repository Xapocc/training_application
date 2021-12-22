import 'package:equatable/equatable.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object?> get props => [];
}

class SplashScreenState extends RouterState {
  const SplashScreenState();

  @override
  List<Object?> get props => [];
}

class MainScreenState extends RouterState {
  const MainScreenState();

  @override
  List<Object?> get props => [];
}