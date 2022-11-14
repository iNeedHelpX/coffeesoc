import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/colors/greygradient.dart';
import 'package:coffeesoc/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the page that shows the google map

class MapPage extends StatelessWidget {
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final LocationController locController =
        Get.put<LocationController>(LocationController());

    Widget buildInfo() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: mediaQuery.size.height * 0.20,
            width: mediaQuery.size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.05,
                vertical: mediaQuery.size.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Location",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: tabicon,
                    ),
                  ),
                  Text(
                    'Drag to select the location of your recommendation',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: bg,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.02),
                  Center(
                    child: RoundedButton(
                      buttonText: "Search",
                      iconWithSizedBox: Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.white,
                          ),
                          SizedBox(width: mediaQuery.size.width * 0.015),
                        ],
                      ),
                      buttonColour: kPrimaryAccentColour,
                      buttonFontSize: mediaQuery.size.width * 0.035,
                      onPressed: () => Get.to(
                          () => const SearchLocationPage(isSearchFeed: false)),
                      buttonHeight: mediaQuery.size.width * 0.10,
                      buttonLength: mediaQuery.size.width * 0.40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

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
                  myLocationButtonEnabled: false,
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
