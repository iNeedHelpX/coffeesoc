import 'dart:async';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:coffeesoc/pages/map_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

//controller for location, not currently in use
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  late Position? myLocation;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getlocation();
  }

  getlocation() async {
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
    if (isLoading == true) {
      return LoadScreen();
    }
    //position stream?
  }
}
