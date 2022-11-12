import 'package:coffeesoc/controllers/location_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//secondary maps page because i need to learn GetX properly!
class MapsPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      initState: (_) {
        Geolocator.getLastKnownPosition().then((currLocation) =>
            locationController.currentLatLng =
                new LatLng(currLocation!.latitude, currLocation.longitude));
      },
      builder: (_) {
        return Scaffold(
          body: locationController.currentLatLng == null
              ? LoadScreen()
              : Stack(
                  children: [
                    Container(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            //get user location
                            target: locationController.currentLatLng!,
                            zoom: 16),
                        compassEnabled: false,
                        minMaxZoomPreference: MinMaxZoomPreference(15.5, 19),
                        zoomGesturesEnabled: true,
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
      },
    );
  }
}
