import 'package:equatable/equatable.dart';
import 'package:training_application/app/string.dart';

abstract class Task3ScreenState extends Equatable {}

class LoadingState extends Task3ScreenState {
  @override
  List<Object> get props => [];
}

class DataState extends Task3ScreenState {
  final String _data = AppStrings.dataTask3Screen;

  String get data => _data;

  @override
  List<Object> get props => [];
}

class ErrorState extends Task3ScreenState {
  ErrorState(String errorMessage) : _errorMessage = errorMessage;

  final String _errorMessage;

  String get errorMessage => _errorMessage;

  @override
  List<Object> get props => [];
}
