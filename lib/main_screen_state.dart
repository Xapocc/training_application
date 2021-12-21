import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {}

class LoadingState extends MainScreenState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MainScreenState {
  final String data = "data";

  @override
  List<Object> get props => [];
}

class ErrorState extends MainScreenState {
  @override
  List<Object> get props => [];
}
