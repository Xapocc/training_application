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
  const RouterStateTask3Screen({required Locale locale}) : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateChooseScreen extends RouterState {
  const RouterStateChooseScreen({required Locale locale}) : super(locale: locale);

  @override
  List<Object?> get props => [super._locale];
}

class RouterStateTask4Screen extends RouterState {
  const RouterStateTask4Screen({required Locale locale}) : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateStatisticScreen extends RouterState {
  const RouterStateStatisticScreen(int sec, {required Locale locale})  : _seconds = sec, super(locale: locale);

  final int _seconds;

  int get seconds => _seconds;

  @override
  List<Object?> get props => [];
}

class RouterStateGpsTracker extends RouterState {
  const RouterStateGpsTracker({required Locale locale}) : super(locale: locale);

  @override
  List<Object?> get props => [];
}

class RouterStateGpsPathMap extends RouterState {
  const RouterStateGpsPathMap({required Locale locale}) : super(locale: locale);

  @override
  List<Object?> get props => [];
}
