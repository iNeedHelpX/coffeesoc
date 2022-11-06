import 'package:geolocator/geolocator.dart';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

//this is the page that shows the google map

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  LatLng? currentLatLng;
  Completer<GoogleMapController> _googlemapController = Completer();

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng =
            new LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  // void getUserLocation() => _getUserLocation();
  //get usr location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLatLng == null
          ? LoadScreen()
          : Stack(
              children: [
                // you must wrap the map within a container or else it will say something about render box not being laid out and this: Another exception was thrown: RenderUiKitView object was given an infinite size during layout.

                Container(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        //get user location
                        target: currentLatLng!,
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
