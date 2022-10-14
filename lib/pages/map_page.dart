import 'package:coffeesoc/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the page that shows the google map
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // you must wrap the map within a container or else it will say something about render box not being laid out and this: Another exception was thrown: RenderUiKitView object was given an infinite size during layout.

          Container(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  //get user location
                  target: LatLng(locationController.myLocation!.latitude,
                      locationController.myLocation!.longitude),
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
          ),
        ],
      ),
    );
  }
}
