import 'package:coffeesoc/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the page that shows the google map

class MapPage extends StatelessWidget {
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final LocationController locController =
        Get.put<LocationController>(LocationController());

    Widget googleMap() {
      return Obx(() => locController.latitude.value != null &&
              locController.longitude.value != null
          ? Center(
              child: Container(
                height: mediaQuery.size.height / 2,
                width: mediaQuery.size.width - 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(27)),
                child: GoogleMap(
                  onMapCreated: (controller) =>
                      locController.googleMapController.value = controller,
                  zoomControlsEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    locController.latitude.value = position.target.latitude;
                    locController.longitude.value = position.target.longitude;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      locController.latitude.value!,
                      locController.longitude.value!,
                    ),
                    zoom: 18.5,
                  ),
                  minMaxZoomPreference: MinMaxZoomPreference(18, 20),
                  mapType: MapType.hybrid,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  //this restricts the api useage of maps
                  cameraTargetBounds: CameraTargetBounds(
                    LatLngBounds(
                      northeast: LatLng(43.7970928, -79.3067414),
                      southwest: LatLng(43.592580, -79.483674),
                    ),
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()));
    }

    //you will need to load the google map or show the loading map screen if there is no known location of user
    return Stack(
      children: [googleMap()],
    );
  }
}
