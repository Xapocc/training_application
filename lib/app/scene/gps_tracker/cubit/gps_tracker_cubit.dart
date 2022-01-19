import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';
import 'package:training_application/main.dart';

class GpsTrackerScreenCubit extends Cubit<GpsTrackerScreenState> {
  StreamSubscription? _subscriptionLocation;

  GpsTrackerScreenCubit() : super(TrackingState());

  void goToTrackingState() {
    emit(TrackingState());

    (state as TrackingState).locationsData.clear();
  }

  void goToPauseState() async {
    emit(PauseState(state));
  }

  Future<void> saveLocationsData() async {
    await locationsDataUseCase!.saveLocationsData((state as PauseState).locationsData);
  }

  bool isLocationsDataEmpty() {
    return state.locationsData.length >= 2 ? false : true;
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

    _subscriptionLocation = location.onLocationChanged.listen((event) {
      _savePoint(event, distanceFilter: 0.0005);
    });

    emit(TrackingState(true));
  }

  void _savePoint(LocationData point, {double distanceFilter = 0}) {
    if (point.latitude == null || point.longitude == null) {
      return;
    }

    if ((state as TrackingState).locationsData.isEmpty) {
      (state as TrackingState).locationsData.add(point);
      emit(TrackingState(
          true,
          (state as TrackingState).locationPointsCounter + 1,
          state.locationsData));
      return;
    }

    // latitude/longitude null is impossible due to check in beginning of this method
    bool add = sqrt(pow(
                (state as TrackingState).locationsData.last.latitude! -
                    point.latitude!,
                2) +
            pow(
                (state as TrackingState).locationsData.last.longitude! -
                    point.longitude!,
                2)) >=
        distanceFilter;

    if (add) {
      (state as TrackingState).locationsData.add(point);
      emit(TrackingState(
          true,
          (state as TrackingState).locationPointsCounter + 1,
          state.locationsData));
    }
  }

  void stopTracking() {
    _subscriptionLocation?.cancel();
    goToPauseState();
  }
}
