import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {}

class LoadingState extends MainScreenState {
  @override
  List<Object> get props => [];
}

class DataState extends MainScreenState {
  final String data = "data";

  @override
  List<Object> get props => [];
}

class ErrorState extends MainScreenState {
  final String errorMessage = "some long error text with a lot of symbols for testing";
  static const double fontSize = 24.0;

  @override
  List<Object> get props => [];
}
