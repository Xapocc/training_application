import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class GpsPathMapScreenState extends Equatable {

  final List<LocationData> _locationsData = List.empty(growable: true);

  List<LocationData> get locationsData => _locationsData;

  @override
  List<Object?> get props => [];
}