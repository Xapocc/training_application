import 'package:location/location.dart';
import 'package:training_application/domain/entities/location_data_entity.dart';
import 'package:training_application/domain/repositories/locations_data_repository_interface.dart';

class LocationsDataUseCase {
  LocationsDataUseCase({required this.repository});

  final ILocationsDataRepository repository;

  Future<List<LocationDataEntity>> getLocationsData() async {
    return repository.getLocationsData();
  }

  saveLocationsData(List<LocationData> locationsDataList) async {
    await repository.saveLocationsData(locationsDataList);
  }

}