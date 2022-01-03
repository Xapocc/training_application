import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:training_application/app/string.dart';

abstract class StatisticScreenState extends Equatable {
  static const List<String> imagesUrls = AppStrings.imagesCatsUrls;
  static final List<Image> _images = List<Image>.empty(growable: true);
  static List<Image> get images => _images;
}

class TimerState extends StatisticScreenState {
  TimerState(int time)
      : _time = time,
        super();

  final int _time;

  int get time => _time;

  @override
  List<Object?> get props => [_time];
}

class DataState extends StatisticScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends StatisticScreenState {
  @override
  List<Object?> get props => [];
}
