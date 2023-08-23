import 'dart:async';

import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample(
      {super.key,
      required this.startPosition,
      required this.endPosition,
      this.onTap});
  final String startPosition;
  final String endPosition;
  final Future<void>? onTap;
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.5244, 3.3792),
    zoom: 14.4746,
  );

  final Set<Marker> _markers = <Marker>{};
  final Set<Polygon> _polygons = <Polygon>{};
  final Set<Polyline> _polylines = <Polyline>{};

  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  final int _polylineIdCounter = 1;

  @override
  void initState() {
    getAllDirections();
    // widget.onTap = _goToPlace(lat, lng, boundsNe, boundsSw);
    super.initState();
  }

  void getAllDirections() async {
    var directions = await LocationProvider()
        .getDirections(widget.startPosition, widget.endPosition);

    // final distance = Geolocator.distanceBetween(
    //     directions?["start_location"]["lat"],
    //     directions?["start_location"]["lng"],
    //     directions?["end_location"]["lat"],
    //     directions?["end_location"]["lng"]);

    _setMarker(
        LatLng(directions?['end_location']["lat"],
            directions?['end_location']["lng"]),
        LatLng(directions?['start_location']["lat"],
            directions?['start_location']["lng"]));

    _goToPlace(
        directions?['start_location']["lat"],
        directions?['start_location']["lng"],
        directions?["bounds_ne"],
        directions?["bounds_sw"]);

    _setPolyline(directions?["polyline_decoded"]);
  }

  void _setMarker(LatLng startPoint, endPoint) {
    setState(() {
      _markers.add(
          Marker(markerId: const MarkerId("marker"), position: startPoint));
      _markers.add(
          Marker(markerId: const MarkerId("markerTwo"), position: endPoint));
    });
  }

  void _setPolygon() {
    final String polygonIdVal = "polygon_$_polygonIdCounter";
    _polygonIdCounter++;
    _polygons.add(
      Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: polygonLatLngs,
          strokeWidth: 2,
          fillColor: Colors.transparent),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polyLineIdVal = "polyline_$_polylineIdCounter";
    _polygonIdCounter++;
    _polylines.add(
      Polyline(
        polylineId: PolylineId(polyLineIdVal),
        width: 5,
        color: Colors.blue,
        points: points.map(
          (point) {
            return LatLng(point.latitude, point.longitude);
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: GoogleMap(
              // polylines: {_kPolyline},
              // polygons: {_kPolygon},
              mapType: MapType.normal,
              markers: _markers,
              polygons: _polygons,
              polylines: _polylines,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,

              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (point) {
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _goToPlace(double lat, double lng, Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSw) async {
    // final double lat = place["geometry"]["location"]["lat"];
    // final double lng = place["geometry"]["location"]["lng"];

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 30),
      ),
    );
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSw["lat"], boundsSw["lng"]),
            northeast: LatLng(boundsNe["lat"], boundsNe["lng"])),
        25));
    // _setMarker(LatLng(lat, lng));
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   awsait controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
