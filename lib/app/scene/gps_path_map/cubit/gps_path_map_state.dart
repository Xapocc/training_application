import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class GpsPathMapScreenState extends Equatable {
  const GpsPathMapScreenState([List<LocationData> locationsDataList = const []])
      : _locationsDataList = locationsDataList,
        super();

  final List<LocationData> _locationsDataList;

  List<LocationData> get locationsDataList => _locationsDataList;

  @override
  List<Object?> get props => [];
}
