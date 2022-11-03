import 'package:coffeesoc/globalvars.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//secondary maps page because i need to learn get properly!
class MapsViewPg extends StatefulWidget {
  const MapsViewPg({super.key});

  @override
  State<MapsViewPg> createState() => _MapsViewPgState();
}

class _MapsViewPgState extends State<MapsViewPg> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //map here
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
              //get user location
              target: LatLng(locationController.myLocation.latitude,
                  locationController.myLocation.longitude),
              zoom: 16),
          minMaxZoomPreference: MinMaxZoomPreference(15.5, 19),
          zoomGesturesEnabled: true,

          //this sets the scroll limit so that there is no excessive API usage from scroll off
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              northeast: LatLng(43.7970928, -79.3067414),
              southwest: LatLng(43.592580, -79.483674),
            ),
          ),
        ),
      ],
    );
  }
}
