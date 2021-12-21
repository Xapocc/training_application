import 'package:equatable/equatable.dart';
import 'dart:math';

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
  final String errorMessage =
      "some long error text with a lot of symbols for testing";
  static const double fontSize = 24.0;

  String getWrappedErrorMessage() {
    int step = sqrt(errorMessage.length) * 7 ~/ 5;
    int a = step;
    String newErrorMessage = errorMessage;

    while (a < newErrorMessage.length) {
      newErrorMessage = newErrorMessage.replaceRange(a, a, "\n");
      a += step;
    }

    return newErrorMessage;
  }

  @override
  List<Object> get props => [];
}
