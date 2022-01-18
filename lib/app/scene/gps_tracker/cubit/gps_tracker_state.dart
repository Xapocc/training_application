import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class GpsTrackerScreenState extends Equatable {
  GpsTrackerScreenState();

  final List<LocationData> _locationsData =
      List<LocationData>.empty(growable: true);

  List<LocationData> get locationsData => _locationsData;

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
    locationsData.addAll(state.locationsData);
  }

  @override
  List<Object?> get props => [];
}
