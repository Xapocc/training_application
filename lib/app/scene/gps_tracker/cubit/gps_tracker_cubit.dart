import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GpsTrackerScreenCubit extends Cubit<GpsTrackerScreenState> {
  StreamSubscription? _subscriptionLocation;
  final Location _location = Location();

  GpsTrackerScreenCubit() : super(TrackingState());

  void goToTrackingState() {
    emit(TrackingState());

    (state as TrackingState).locationsData.clear();
  }

  void goToPauseState() async {
    emit(PauseState(state));
  }

  Future<void> saveLocationsData() async {
    await locationsDataUseCase!
        .saveLocationsData((state as PauseState).locationsData);
  }

  bool isLocationsDataEmpty() {
    return !(state.locationsData.length >=
            AppSizes.minLocationPointsGpsTrackerScreen);
  }

  void onPressStartStopButton() {
    (state as TrackingState).isTracking ? stopTracking() : startTracking();
  }

  void startTracking() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();

      if (!serviceEnabled) return;
    }

    permission_handler.PermissionStatus permissionStatus =
        await permission_handler.Permission.location.status;

    if(permissionStatus.isPermanentlyDenied) {
      Fluttertoast.showToast(msg: "Allow access to location in device setting");
      return;
    }

    if (!permissionStatus.isGranted) {
      permissionStatus = await permission_handler.Permission.location.request();

      if (!permissionStatus.isGranted) return;
    }

    _subscriptionLocation = _location.onLocationChanged.listen((event) {
      try {
        _savePoint(event,
            distanceFilter: AppSizes.distanceFilterGpsTrackerScreen);
      } catch (ex) {
        _subscriptionLocation?.cancel();
        return;
      }
    });

    emit(TrackingState(true));
  }

  void _savePoint(LocationData point,
      {double distanceFilter =
          AppSizes.distanceFilterDefaultGpsTrackerScreen}) {
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
