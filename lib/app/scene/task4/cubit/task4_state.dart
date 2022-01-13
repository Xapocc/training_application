import 'package:equatable/equatable.dart';
import 'package:training_application/app/string.dart';

class Task4ScreenState extends Equatable {
  const Task4ScreenState(
      {bool isButtonEnabled = false,
      int seconds = 0,
      int secondsStart = 0,
      int dataStateCounter = 0,
      int errorStateCounter = 0,
      String dataStateLastDate = AppStrings.lastDateDefault,
      String errorStateLastDate = AppStrings.lastDateDefault})
      : _isButtonEnabled = isButtonEnabled,
        _seconds = seconds,
        _secondsStart = secondsStart,
        _dataStateCounter = dataStateCounter,
        _errorStateCounter = errorStateCounter,
        _dataStateLastDate = dataStateLastDate,
        _errorStateLastDate = errorStateLastDate,
        super();

  Task4ScreenState.fromState(Task4ScreenState state,
      {bool? isButtonEnabled,
      int? seconds,
      int? secondsStart,
      int? dataStateCounter,
      int? errorStateCounter,
      String? dataStateLastDate,
      String? errorStateLastDate})
      : _isButtonEnabled = isButtonEnabled ?? state.isButtonEnabled,
        _seconds = seconds ?? state.seconds,
        _secondsStart = secondsStart ?? state.secondsStart,
        _dataStateCounter = dataStateCounter ?? state.dataStateCounter,
        _errorStateCounter = errorStateCounter ?? state.errorStateCounter,
        _dataStateLastDate = dataStateLastDate ?? state.dataStateLastDate,
        _errorStateLastDate = errorStateLastDate ?? state.errorStateLastDate,
        super();

  final bool _isButtonEnabled;
  final int _seconds;
  final int _secondsStart;
  final int _dataStateCounter;
  final int _errorStateCounter;
  final String _dataStateLastDate;
  final String _errorStateLastDate;

  bool get isButtonEnabled => _isButtonEnabled;

  int get seconds => _seconds;

  int get secondsStart => _secondsStart;

  int get dataStateCounter => _dataStateCounter;

  int get errorStateCounter => _errorStateCounter;

  String get dataStateLastDate => _dataStateLastDate;

  String get errorStateLastDate => _errorStateLastDate;

  @override
  List<Object?> get props => [
        _isButtonEnabled,
        _seconds,
        _secondsStart,
        _dataStateCounter,
        _errorStateCounter,
        _dataStateLastDate,
        _errorStateLastDate
      ];
}
