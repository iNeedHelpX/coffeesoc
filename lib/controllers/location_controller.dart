import 'dart:async';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:coffeesoc/pages/map_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//controller for location, not currently in use
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  Position? myLocation;
  Rx<Geolocator>? geolocator = Geolocator().obs;
  LatLng? currentLatLng;
  RxBool isLoading = false.obs;
  // RxBool isLoading = false.obs;
  // Rx<LatLng> currentLatLng = LatLng().obs;

  @override
  void onInit() async {
    super.onInit();
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

    myLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //position stream?
  }

  getMyLocation() async {
    myLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
