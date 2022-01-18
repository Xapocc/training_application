import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_state.dart';

class GpsPathMapScreenCubit extends Cubit<GpsPathMapScreenState> {
  GpsPathMapScreenCubit() : super(GpsPathMapScreenState());

  bool checkInternetConnection() {
    return true;
  }
}
