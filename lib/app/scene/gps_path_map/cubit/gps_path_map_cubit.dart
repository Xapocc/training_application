import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_state.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/domain/entities/location_data_entity.dart';
import 'package:training_application/main.dart';

class GpsPathMapScreenCubit extends Cubit<GpsPathMapScreenState> {
  late StreamController _controllerLocationsDataList;

  StreamSubscription? _subscriptionLocationsDataList;

  GpsPathMapScreenCubit() : super(const GpsPathMapScreenState()) {
    _controllerLocationsDataList = StreamController<List<LocationData>>();

    _subscriptionLocationsDataList =
        _controllerLocationsDataList.stream.listen((event) {
      emit(GpsPathMapScreenState(event));

      _subscriptionLocationsDataList?.cancel();
    });

    loadLocationsDataList();
  }

  void loadLocationsDataList() async {
    List<LocationDataEntity> locationsDataEntities =
        await locationsDataUseCase!.getLocationsData();

    List<LocationData> locationsDataList = [];

    for (LocationDataEntity entity in locationsDataEntities) {
      LocationData locationData = LocationData.fromMap({
        AppStrings.latitudeFullGpsPathMapScreen: entity.latitude,
        AppStrings.longitudeFullGpsPathMapScreen: entity.longitude
      });

      locationsDataList.add(locationData);
    }

    _controllerLocationsDataList.add(locationsDataList);
  }

  void toastNoInternetConnection() {
    Fluttertoast.showToast(
        msg: AppStrings.messageInternetConnectionGpsPathMapScreen);
  }
}
