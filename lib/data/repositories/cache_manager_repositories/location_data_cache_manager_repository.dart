import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:training_application/data/models/location_data_model.dart';
import 'package:training_application/domain/entities/location_data_entity.dart';
import 'package:training_application/domain/mappers/location_data_mapper.dart';
import 'package:training_application/domain/repositories/locations_data_repository_interface.dart';

class LocationsDataCacheManagerRepositoryImpl
    implements ILocationsDataRepository {
  @override
  Future<List<LocationDataEntity>> getLocationsData() async {
    List<LocationDataEntity> locationDataEntitiesList = [];

    FileInfo? file =
        await DefaultCacheManager().getFileFromCache("locations_data");

    if (file == null) return [];

    Map<String, dynamic> allLocationsDataMap =
        jsonDecode(await file.file.readAsString());

    for (String value in allLocationsDataMap.values) {
      Map<String, dynamic> locationDataMap = jsonDecode(value);
      if (locationDataMap["latitude"] == null ||
          locationDataMap["longitude"] == null) return [];

      locationDataEntitiesList.add(LocationDataMapper().mapLocationData(
          LocationDataModel(
              latitude: locationDataMap["latitude"]!,
              longitude: locationDataMap["longitude"]!)));
    }

    print("data get");

    return locationDataEntitiesList;
  }

  @override
  Future<void> saveLocationsData(List<LocationData> locationsDataList) async {
    Map<String, String> allLocationsMap = Map.fromIterable([]);

    int index = 0;
    for (LocationData item in locationsDataList) {
      if (item.latitude == null || item.longitude == null) return;

      // null value is checked above
      Map<String, double> locationDataMap = {
        "latitude": item.latitude!,
        "longitude": item.longitude!
      };

      String locationDataJsonString = jsonEncode(locationDataMap);

      allLocationsMap.putIfAbsent(
          "location_data_$index", () => locationDataJsonString);
      index++;
    }

    print("data saved");

    await DefaultCacheManager().putFile("locations_data",
        Uint8List.fromList(utf8.encode(jsonEncode(allLocationsMap))));
  }
}
