import 'dart:async';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:coffeesoc/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

//location controller
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  Rxn<GoogleMapController> googleMapController = Rxn<GoogleMapController>();

  final Location loc = Location();
  // Position? myLocation;
  //this controls getting the location of the user!!
  // LatLng? currentLatLng;
  final RxnDouble latitude = RxnDouble();
  final RxnDouble longitude = RxnDouble();
//stream subscription position
  late StreamSubscription<Position> streamSubscription;
  Rxn<Position> pos = Rxn<Position>();
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
      LocationData locationData = await loc.getLocation();

      latitude.value = locationData.latitude!;

      longitude.value = locationData.longitude!;
    } catch (e) {
      Get.snackbar(
        'Error'.tr,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    super.onReady();
  }

  //mayvbe set map screen?
  setMapScreen(Position? pos) {
    if (pos != null) {
      Get.offAll(() => LoadScreen());
    } else {
      Get.offAll(() => MapPage());
    }
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
  }

  //fetch location function

}
