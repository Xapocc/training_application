import 'package:location/location.dart';
import 'package:training_application/domain/entities/location_data_entity.dart';

abstract class ILocationsDataRepository {
  // get

  Future<List<LocationDataEntity>> getLocationsData();

  // set

  void saveLocationsData(List<LocationData> locationsDataList);
}