import 'dart:developer';

import 'package:fl_mod3/core/utils/location_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  String result = '';
  String styleMap = '';
  GoogleMapController? mapController;

  @override
  void initState() {
    _loadStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('====> build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getLocation();
            },
            child: const Text('Ubicacion'),
          ),
          Expanded(
            child: GoogleMap(
              style: styleMap.isNotEmpty ? styleMap : null,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 10,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: {
                const Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(37.43296265331129, -122.08832357078792),
                  infoWindow: InfoWindow(title: 'Marker 1'),
                ),
                const Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(37.53296265331129, -122.08832357078792),
                  infoWindow: InfoWindow(title: 'Marker 2'),
                ),
              },
              // polylines: {
              //   Polyline(
              //     color: Colors.red,
              //     width: 2,
              //     polylineId: PolylineId('1'),
              //     points: [
              //       LatLng(37.43296265331129, -122.08832357078792),
              //       LatLng(37.53296265331129, -122.08832357078792),
              //       LatLng(37.63296265331129, -122.08832357078792),
              //     ],
              //   ),
              // },
              // polygons: {
              //   Polygon(
              //     polygonId: PolygonId('1'),
              //     points: [
              //       LatLng(-16.497029, -68.137786),
              //       LatLng(-16.495938, -68.127766),
              //       LatLng(-16.503160, -68.142593),
              //     ],
              //     fillColor: Colors.red,
              //     strokeColor: Colors.black,
              //     strokeWidth: 2,
              //   ),
              // },

              circles: {
                const Circle(
                  circleId: CircleId('1'),
                  center: LatLng(-16.497029, -68.137786),
                  radius: 200,
                  fillColor: Colors.red,
                  strokeWidth: 5,
                ),
                const Circle(
                  circleId: CircleId('2'),
                  center: LatLng(-16.495938, -68.127766),
                  radius: 200,
                  fillColor: Colors.green,
                  strokeWidth: 5,
                )
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getLocation() async {
    final locationResp = await LocationUtil.getLocation();
    if (locationResp.error != null) {
      result = 'Error ${locationResp.error}';
    }

    if (locationResp.location != null) {
      result =
          'Ubicacion ${locationResp.location!.latitude} ${locationResp.location!.longitude}';
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationResp.location!.latitude!,
              locationResp.location!.longitude!,
            ),
            zoom: 15,
            bearing: 50,
            tilt: 90,
          ),
        ),
      );
    }

    setState(() {});
  }

  Future<void> _loadStyle() async {
    styleMap = await rootBundle.loadString(
      'assets/map_style/snnazy_style.json',
    );
    setState(() {});
  }
}
