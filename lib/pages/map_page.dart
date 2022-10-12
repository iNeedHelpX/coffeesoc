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

//latlng northwest
//43.780326,-79.5162897

//lat lng southeast
//43.632439, -79.191675
class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _googlemapController = Completer();
  static const tobounds = {
    "north": -79.5162897,
  "south": -79.191675,
 " west": 43.780326,
 " east": 43.632439,
  };

  // static LatLng _initialPosition;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        SafeArea(
          child: GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference(14, 17),
            initialCameraPosition: CameraPosition(target: , zoom: 14.5),
          ),
        ),
      ],
    ));
  }
}
