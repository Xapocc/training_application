import 'package:equatable/equatable.dart';

abstract class GpsTrackerScreenState extends Equatable {
  const GpsTrackerScreenState();

  @override
  List<Object?> get props => [];
}

class TrackingState extends GpsTrackerScreenState {
  const TrackingState([bool isTracking = false])
      : _isTracking = isTracking,
        super();

  final bool _isTracking;

  bool get isTracking => _isTracking;

  @override
  List<Object?> get props => [_isTracking];
}

class PauseState extends GpsTrackerScreenState {
  const PauseState() : super();

  @override
  List<Object?> get props => [];
}
