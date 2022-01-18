import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class GpsTrackerScreenState extends Equatable {
  GpsTrackerScreenState();

  final List<LocationData> _locationsData = List.empty(growable: true);

  List<LocationData> get locationsData => _locationsData;

  @override
  List<Object?> get props => [];
}

class TrackingState extends GpsTrackerScreenState {
  TrackingState(
      [bool isTracking = false,
      int locationPointsCounter = 0,
      List<LocationData> locationsData = const []])
      : _isTracking = isTracking,
        _locationPointsCounter = locationPointsCounter,
        super() {
    _locationsData.clear();
    _locationsData.addAll(locationsData);
  }

  final bool _isTracking;
  final int _locationPointsCounter;

  bool get isTracking => _isTracking;

  int get locationPointsCounter => _locationPointsCounter;

  @override
  List<Object?> get props => [_isTracking, _locationPointsCounter];
}

class PauseState extends GpsTrackerScreenState {
  PauseState(GpsTrackerScreenState state) : super() {
    locationsData.addAll(state.locationsData);
  }

  @override
  List<Object?> get props => [];
}
