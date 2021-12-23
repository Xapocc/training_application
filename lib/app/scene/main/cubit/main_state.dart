import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {}

class LoadingState extends MainScreenState {
  @override
  List<Object> get props => [];
}

class DataState extends MainScreenState {
  final String _data = "data";

  String get data => _data;

  @override
  List<Object> get props => [];
}

class ErrorState extends MainScreenState {
  ErrorState(String errorMessage) : _errorMessage = errorMessage;

  final String _errorMessage;

  String get errorMessage => _errorMessage;

  @override
  List<Object> get props => [];
}
