import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//location controller
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  Rxn<GoogleMapController> googleMapController = Rxn<GoogleMapController>();
  // Position? myLocation;
  //this controls getting the location of the user!!
  // LatLng? currentLatLng;
  final RxnDouble latitude = RxnDouble();
  final RxnDouble longitude = RxnDouble();
//stream subscription position
  late StreamSubscription<Position> streamSubscription;

//use this method to get permissions
  @override
  void onInit() async {
    getpermission();
    super.onInit();
  }

//ON READY METHOD used to get location of user
  @override
  void onReady() async {
    try {
      Position locations = await Geolocator.getCurrentPosition();
      latitude.value = locations.latitude;
      longitude.value = locations.longitude;
    } catch (e) {
      Get.snackbar(
        'ERROR! No location'.tr,
        e.toString(),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
    }
    super.onReady();
  }

//get the users permissions for location
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

}
