import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';

class GpsTrackerScreenCubit extends Cubit<GpsTrackerScreenState> {
  StreamSubscription? _subscriptionLocation;

  GpsTrackerScreenCubit() : super(TrackingState());

  void goToTrackingState() {
    emit(TrackingState());

    (state as TrackingState).locationPoints.clear();
  }

  void goToPauseState() {
    emit(PauseState(state));
  }

  void onPressStartStopButton() {
    (state as TrackingState).isTracking ? stopTracking() : startTracking();
  }

  void startTracking() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (!serviceEnabled) return;
    }

    permission_handler.PermissionStatus permissionStatus =
        await permission_handler.Permission.location.status;

    if (!permissionStatus.isGranted) {
      permissionStatus = await permission_handler.Permission.location.request();

      if (!permissionStatus.isGranted) return;
    }

    location.changeSettings(distanceFilter: 0.00001);
    _subscriptionLocation = location.onLocationChanged.listen((event) {
      _savePoint(event);
      print("$event count: ${(state as TrackingState).locationPoints.length}");
    });

    emit(TrackingState(true));
  }

  void _savePoint(LocationData point) {
    (state as TrackingState).locationPoints.add(point);
  }

  void stopTracking() {
    _subscriptionLocation?.cancel();
    goToPauseState();
  }
}
