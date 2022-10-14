import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//controller for location
class LocationController extends GetxController {
  static LocationController instance = Get.find();

  var lat = "getting latitude..".obs;
  var lon = "getting longitude..".obs;
  var address = "getting address..".obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onReady() {
    super.onReady();
    getLocationPermission();
  }

  @override
  void onClose() {
    //don't forget to close
    streamSubscription.cancel();
  }

  getLocationPermission() async {
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
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //position stream?
  }

  getMyLocation() {
    Geolocator.getCurrentPosition().then((currLocation) {
      LatLng currentLatLng;
      currentLatLng = new LatLng(currLocation.latitude, currLocation.longitude);
    });
  }
}
