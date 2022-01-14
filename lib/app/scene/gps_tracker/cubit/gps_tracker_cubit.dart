import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/gps_tracker/cubit/gps_tracker_state.dart';

class GpsTrackerScreenCubit extends Cubit<GpsTrackerScreenState> {
  GpsTrackerScreenCubit() : super(const TrackingState());

  void goToTrackingState() {
    emit(const TrackingState());
  }

  void goToPauseState() {
    emit(const PauseState());
  }

  void startTracking() {
    emit(const TrackingState(true));
  }


}
