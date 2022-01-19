import 'package:training_application/data/models/location_data_model.dart';
import 'package:training_application/domain/entities/location_data_entity.dart';

class LocationDataMapper {
  LocationDataEntity mapLocationData(LocationDataModel locationDataModel) =>
      LocationDataEntity(
          latitude: locationDataModel.latitude,
          longitude: locationDataModel.longitude);
}
