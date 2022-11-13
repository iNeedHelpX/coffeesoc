import 'dart:async';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//location controller
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  Position? myLocation;

  //this controls getting the location of the user!!
  LatLng? currentLatLng;

  //fetch location function

  RxBool? isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchLoc();
    getpermission();
  }

  getpermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("location service is not enabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //do stuff here
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //stuff
        return Future.error("location permissions denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permissions permanently denied");
    }

    // myLocation = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
  }

  //fetch location function
  Future<void> getCurrentLocation() async {}

  //secondary location function i dont know how this works!
  void fetchLoc() async {
    try {
      isLoading!(true);
      await Geolocator.getCurrentPosition().then((currLocation) =>
          currentLatLng =
              new LatLng(currLocation.latitude, currLocation.longitude));
    } finally {
      isLoading!(false);
    }
    update();
  }
}
