import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the page that shows the google map
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this here doesn't work?
      body: Stack(
        // alignment: Alignment.center,
        children: [
          // you must wrap the map within a container or else it will say something about render box not being laid out and this: Another exception was thrown: RenderUiKitView object was given an infinite size during layout.
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

          Container(
            height: 200,
            width: 300,
            color: brighty,
          ),
        ],
      ),
    );
  }
}
