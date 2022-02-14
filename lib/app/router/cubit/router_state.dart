import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RouterState extends Equatable {
  const RouterState({Locale? locale}) : _locale = locale ?? const Locale('en');

  @override
  List<Object?> get props => [_locale];

  final Locale _locale;

  get locale => _locale;
}

class RouterStateSplashScreen extends RouterState {
  const RouterStateSplashScreen() : super();

  @override
  List<Object?> get props => [];
}

class RouterStateTask3Screen extends RouterState {
  const RouterStateTask3Screen({required Locale locale})
      : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateChooseScreen extends RouterState {
  const RouterStateChooseScreen({required Locale locale})
      : super(locale: locale);

  @override
  List<Object?> get props => [super._locale];
}

class RouterStateData extends RouterState {
  const RouterStateData({
    required Locale locale,
    required int dataCounter,
    required int errorCounter,
    required String dataDate,
    required String errorDate,
  })  : _dataCounter = dataCounter,
        _errorCounter = errorCounter,
        _dataDate = dataDate,
        _errorDate = errorDate,
        super(locale: locale);

  final int _dataCounter;
  final int _errorCounter;
  final String _dataDate;
  final String _errorDate;

  int get dataCounter => _dataCounter;

  int get errorCounter => _errorCounter;

  String get dataDate => _dataDate;

  String get errorDate => _errorDate;

  @override
  List<Object?> get props =>
      [_dataCounter, _errorCounter, _dataDate, _errorDate];
}

class RouterStateTask4Screen extends RouterStateData {
  const RouterStateTask4Screen({
    required Locale locale,
    required int dataCounter,
    required int errorCounter,
    required String dataDate,
    required String errorDate,
  }) : super(
            locale: locale,
            dataCounter: dataCounter,
            errorCounter: errorCounter,
            dataDate: dataDate,
            errorDate: errorDate);

  @override
  List<Object?> get props =>
      [_dataCounter, _errorCounter, _dataDate, _errorDate];
}

class RouterStateStatisticScreen extends RouterStateData {
  const RouterStateStatisticScreen(
    int sec, {
    required Locale locale,
    required int dataCounter,
    required int errorCounter,
    required String dataDate,
    required String errorDate,
  })  : _seconds = sec,
        super(
            locale: locale,
            dataCounter: dataCounter,
            errorCounter: errorCounter,
            dataDate: dataDate,
            errorDate: errorDate);

  final int _seconds;

  int get seconds => _seconds;

  @override
  List<Object?> get props =>
      [_seconds, _dataCounter, _errorCounter, _dataDate, _errorDate];
}

class RouterStateGpsTrackerScreen extends RouterState {
  const RouterStateGpsTrackerScreen({required Locale locale})
      : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateGpsPathMapScreen extends RouterState {
  const RouterStateGpsPathMapScreen({required Locale locale})
      : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateLoginScreen extends RouterState {
  const RouterStateLoginScreen({required Locale locale})
      : super(locale: locale);

  @override
  List<Object?> get props => [];
}
