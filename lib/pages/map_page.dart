import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:ui';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _googlemapController = Completer();
  static const tobounds =[
    //northwest
    [43.780326,-79.5162897],
    //southeast
    [43.632439, -79.191675]
  ];
  // static LatLng _initialPosition;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        SafeArea(
          child: GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference(13, 17),
            initialCameraPosition: CameraPosition(target: , zoom: 14.5),
          ),
        ),
      ],
    ));
  }
}
