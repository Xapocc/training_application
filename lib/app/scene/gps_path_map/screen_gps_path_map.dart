import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_cubit.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';

class ScreenGpsPathMap extends StatelessWidget {
  const ScreenGpsPathMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpsPathMapScreenCubit(),
      child: BlocBuilder<GpsPathMapScreenCubit, GpsPathMapScreenState>(
        builder: (context, state) {
          return DefaultTabController(
            length: AppSizes.lengthTabControllerGpsPathMapScreen,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.map),
                    ),
                    Tab(
                      icon: Icon(Icons.list),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  state.locationsDataList.isNotEmpty
                      ? MapGpsPath(
                          locationData: state.locationsDataList,
                        )
                      : const Center(
                          child: Text(
                              AppStrings.messageDataIsMissingGpsPathMapScreen),
                        ),
                  Container(
                    color: AppColors.colorBgListViewGpsPathMapScreen,
                    child: ListView.builder(
                      itemCount: state.locationsDataList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: (index.isEven)
                              ? AppColors
                                  .colorBgEvenListViewItemGpsPathMapScreen
                              : AppColors
                                  .colorBgOddListViewItemGpsPathMapScreen,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSizes
                                    .paddingListViewItemGpsPathMapScreen),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:
                                      AppSizes.flexIndexColumnGpsPathMapScreen,
                                  child: Center(
                                    child: Text(
                                      AppStrings
                                          .indexColumnListViewItemGpsPathMapScreen(
                                              index),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: AppSizes.flexDataColumnGpsPathMapScreen,
                                  child: Text(AppStrings
                                      .dataColumnListViewItemGpsPathMapScreen(
                                          AppStrings
                                              .latitudeShortGpsPathMapScreen,
                                          state.locationsDataList[index]
                                              .latitude)),
                                ),
                                Expanded(
                                    flex: AppSizes
                                        .flexPaddingColumnGpsPathMapScreen,
                                    child: Container()),
                                Expanded(
                                  flex: AppSizes.flexDataColumnGpsPathMapScreen,
                                  child: Text(AppStrings
                                      .dataColumnListViewItemGpsPathMapScreen(
                                          AppStrings
                                              .longitudeShortGpsPathMapScreen,
                                          state.locationsDataList[index]
                                              .longitude)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapGpsPath extends StatefulWidget {
  const MapGpsPath({Key? key, required List<LocationData> locationData})
      : _locationData = locationData,
        super(key: key);

  final List<LocationData> _locationData;

  List<LocationData> get locationData => _locationData;

  @override
  State<MapGpsPath> createState() => MapGpsPathState();
}

class MapGpsPathState extends State<MapGpsPath>
    with AutomaticKeepAliveClientMixin<MapGpsPath> {
  final Completer<GoogleMapController> _completer = Completer();
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: AppStrings.apiKeyGoogleMaps);

  final List<Polyline> polyline = [];
  final List<Marker> markers = [];
  final List<Circle> circles = [];

  CameraPosition _kPosition = const CameraPosition(target: LatLng(0, 0));
  bool _isPathLoaded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _kPosition = _computeCameraPosition();
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Stack(alignment: Alignment.center, children: [
      Visibility(
        visible: _isPathLoaded,
        maintainSemantics: true,
        maintainState: true,
        maintainSize: true,
        maintainAnimation: true,
        child: Scaffold(
          body: GoogleMap(
            myLocationButtonEnabled: false,
            scrollGesturesEnabled: true,
            rotateGesturesEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: _kPosition,
            onMapCreated: (GoogleMapController controller) async {
              _completer.complete(controller);

              // network connection check
              while (true) {
                try {
                  await _computePath();
                  setState(() {
                    _isPathLoaded = true;
                  });
                  break;
                } catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(
                          milliseconds: AppSizes
                                  .millisecondsSnackBarGpsPathMapScreen -
                              AppSizes.millisecondsDifferenceGpsPathMapScreen),
                      content: Text(
                          AppStrings.messageInternetConnectionGpsPathMapScreen),
                    ),
                  );

                  await Future.delayed(
                    const Duration(
                        milliseconds:
                            AppSizes.millisecondsSnackBarGpsPathMapScreen),
                  );

                  continue;
                }
              }
            },
            polylines: Set.from(polyline),
            markers: Set.from(markers),
            circles: Set.from(circles),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FractionallySizedBox(
            heightFactor: currentOrientation == Orientation.portrait
                ? AppSizes.factorButtonCameraGpsPathMapScreen
                : null,
            widthFactor: currentOrientation == Orientation.portrait
                ? null
                : AppSizes.factorButtonCameraGpsPathMapScreen,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: AppSizes.paddingButtonCameraGpsPathMapScreen),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colorBgCameraButtonGpsPathMapScreen,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith((states) =>
                            AppColors
                                .colorOverlayCameraButtonGpsPathMapScreen)),
                    onPressed: () async {
                      final GoogleMapController controller =
                          await _completer.future;
                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(_kPosition));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(
                          AppSizes.paddingIconButtonCameraGpsPathMapScreen),
                      child: Icon(
                        Icons.home,
                        color: AppColors.colorFgCameraButtonGpsPathMapScreen,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: !_isPathLoaded,
        child: const CircularProgressIndicator(),
      )
    ]);
  }

  CameraPosition _computeCameraPosition() {
    double totalLat = 0, totalLng = 0;

    for (int i = 0; i < widget.locationData.length; i++) {
      totalLat += widget.locationData[i].latitude!;
      totalLng += widget.locationData[i].longitude!;
    }

    return CameraPosition(
      target: LatLng(totalLat / widget.locationData.length,
          totalLng / widget.locationData.length),
      zoom: AppSizes.zoomCameraPositionGpsPathMapScreen,
    );
  }

  Future<void> _computePath() async {
    List<LatLng> routeCoords = List.empty(growable: true);
    List<Circle> newCircles = List.empty(growable: true);
    // null latitude/longitude is impossible due to check in add method
    for (int i = 0; i < widget.locationData.length; i++) {
      if (i != widget.locationData.length - 1) {
        routeCoords.addAll((await googleMapPolyline.getCoordinatesWithLocation(
            origin: LatLng(widget.locationData[i].latitude!,
                widget.locationData[i].longitude!),
            destination: LatLng(widget.locationData[i + 1].latitude!,
                widget.locationData[i + 1].longitude!),
            mode: RouteMode.driving))!);
      }
    }

    for (int i = 0; i < routeCoords.length; i++) {
      newCircles.add(Circle(
        circleId: CircleId(AppStrings.circleIdGpsPathMapScreen(i)),
        strokeWidth: AppSizes.strokeWidthCircleGpsPathMapScreen,
        radius: AppSizes.radiusCircleGpsPathMapScreen,
        fillColor: i == 0
            ? AppColors.colorCircleStartGpsPathMapScreen
            : AppColors.colorPolylineGpsPathMapScreen,
        strokeColor: i == 0
            ? AppColors.colorCircleStartGpsPathMapScreen
            : AppColors.colorPolylineGpsPathMapScreen,
        center: LatLng(routeCoords[i].latitude, routeCoords[i].longitude),
      ));
    }

    setState(() {
      polyline.clear();
      markers.clear();
      circles.clear();

      circles.addAll(newCircles);

      markers.add(
        Marker(
          markerId: const MarkerId(AppStrings.markerIdGpsPathMapScreen),
          position: LatLng(
            widget.locationData.last.latitude!,
            widget.locationData.last.longitude!,
            // null value is checked
          ),
          alpha: AppSizes.alphaMarkerGpsPathMapScreen,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

      polyline.add(
        Polyline(
          polylineId: const PolylineId(AppStrings.polylineIdGpsPathMapScreen),
          points: routeCoords,
          width: AppSizes.widthPolylineGpsPathMapScreen,
          color: AppColors.colorPolylineGpsPathMapScreen,
        ),
      );
    });
  }
}
