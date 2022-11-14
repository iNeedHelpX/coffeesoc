import 'package:coffeesoc/controllers/location_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the page that shows the google map

class MapPage extends StatelessWidget {
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final LocationController locController =
        Get.put<LocationController>(LocationController());

    Widget buildGoogleMapWidget() {
      return Obx(
        () => locationController.latitude.value != null &&
                locationController.longitude.value != null
            ? GoogleMap(
                padding: EdgeInsets.only(
                  bottom: mediaQuery.size.height * 0.25,
                ),
                onMapCreated: (controller) =>
                    locationController.googleMapController.value = controller,
                zoomControlsEnabled: true,
                onCameraMove: (CameraPosition position) {
                  locationController.latitude.value = position.target.latitude;
                  locationController.longitude.value =
                      position.target.longitude;

                  // markers.add(
                  //     Marker(markerId: markerId, position: position.target));
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    locationController.latitude.value!,
                    locationController.longitude.value!,
                  ),
                  zoom: 15,
                ),
                markers: markers,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              )
            : const LoadingPage(),
      );
    }

    return Scaffold(
        //you will need to load the google map or show the loading map screen if there is no known location of user
        body: Obx(
      () => locController.latitude.value != null &&
              locController.longitude.value != null
          ? Stack(
              children: [
                // you must wrap the map within a container or else it will say something about render box not being laid out and this: Another exception was thrown: RenderUiKitView object was given an infinite size during layout.

                Container(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                        //get user location
                        target: LatLng(locController.latitude.value!,
                            locController.longitude.value!),
                        zoom: 15.5),
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
            )
          : LoadScreen(),
    ));
  }
}
