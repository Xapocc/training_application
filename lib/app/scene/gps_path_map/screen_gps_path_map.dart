import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_cubit.dart';
import 'package:training_application/app/scene/gps_path_map/cubit/gps_path_map_state.dart';

class ScreenGpsPathMap extends StatelessWidget {
  const ScreenGpsPathMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpsPathMapScreenCubit(),
      child: BlocBuilder<GpsPathMapScreenCubit, GpsPathMapScreenState>(
          builder: (context, state) {
        return DefaultTabController(
          length: 2,
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
                      : Center(child: Text("Locations data is missing")),
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: state.locationsDataList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: (index % 2 == 0)
                                ? Colors.white
                                : Colors.black12,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                          child: Text("${index + 1}. "))),
                                  Expanded(
                                    flex: 12,
                                    child: Text(
                                        "Lat. ${state.locationsDataList[index].latitude}"),
                                  ),
                                  Expanded(flex: 1, child: Container()),
                                  Expanded(
                                    flex: 12,
                                    child: Text(
                                        "Long. ${state.locationsDataList[index].longitude}"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ]),
          ),
        );
      }),
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
      GoogleMapPolyline(apiKey: "AIzaSyAHPZ12iDgKw6cAjz88u2OlCDNNtedWBpY");

  final List<Polyline> polyline = List.empty(growable: true);
  final List<Marker> markers = List.empty(growable: true);
  final List<Circle> circles = List.empty(growable: true);

  bool _isPathLoaded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    CameraPosition _kPosition = _computeCameraPosition();
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
                      duration: Duration(milliseconds: 2500),
                      content: Text(
                          "Can't connect to google maps services.\nPlease check your internet connection."),
                    ),
                  );

                  await Future.delayed(const Duration(milliseconds: 3000));

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
            heightFactor:
                currentOrientation == Orientation.portrait ? 0.1 : null,
            widthFactor:
                currentOrientation == Orientation.portrait ? null : 0.1,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black26)),
                    onPressed: () async {
                      final GoogleMapController controller =
                          await _completer.future;
                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(_kPosition));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.home,
                        color: Colors.black54,
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
      zoom: 17.0,
    );
  }

  Future<void> _computePath() async {
    final GoogleMapController controller = await _completer.future;
    List<LatLng> routeCoords = List.empty(growable: true);
    List<Circle> newCircles = List.empty(growable: true);

    double totalLat = 0, totalLng = 0;

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
        circleId: CircleId("circle_$i"),
        strokeWidth: 4,
        radius: 4,
        fillColor: i == 0 ? Colors.green : Colors.blue,
        strokeColor: i == 0 ? Colors.green : Colors.blue,
        center: LatLng(routeCoords[i].latitude, routeCoords[i].longitude),
      ));

      totalLat += routeCoords[i].latitude;
      totalLng += routeCoords[i].longitude;
    }

    CameraPosition _kNew = CameraPosition(
      target:
          LatLng(totalLat / routeCoords.length, totalLng / routeCoords.length),
      zoom: 17.0,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(_kNew));

    setState(() {
      polyline.clear();
      markers.clear();
      circles.clear();

      circles.addAll(newCircles);

      markers.add(
        Marker(
          markerId: const MarkerId("end"),
          position: LatLng(
            widget.locationData.last.latitude ?? 0,
            widget.locationData.last.longitude ?? 0,
          ),
          alpha: 0.5,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

      polyline.add(
        Polyline(
          polylineId: const PolylineId('iter'),
          points: routeCoords,
          width: 4,
          color: Colors.blue,
        ),
      );
    });
  }
}
