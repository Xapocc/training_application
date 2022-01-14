import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class GpsTrackerScreenState extends Equatable {
  GpsTrackerScreenState();

  final List<LocationData> _locationPoints =
      List<LocationData>.empty(growable: true);

  List<LocationData> get locationPoints => _locationPoints;

  @override
  List<Object?> get props => [];
}

class TrackingState extends GpsTrackerScreenState {
  TrackingState([bool isTracking = false])
      : _isTracking = isTracking,
        super();

  final bool _isTracking;

  bool get isTracking => _isTracking;

  @override
  List<Object?> get props => [_isTracking];
}

class PauseState extends GpsTrackerScreenState {
  PauseState(GpsTrackerScreenState state) : super() {
    locationPoints.addAll(state.locationPoints);
  }

  @override
  List<Object?> get props => [];
}
