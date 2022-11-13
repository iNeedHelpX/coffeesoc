import 'dart:async';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/Sub_pages/map_loading.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//location controller
class LocationController extends GetxController {
  static LocationController instance = Get.find();
  Rxn<GoogleMapController> googleMapController =
      Rxn<GoogleMapController>();
  Position? myLocation;
  //this controls getting the location of the user!!
  LatLng? currentLatLng;
  final RxnDouble latitude = RxnDouble();
  final RxnDouble longitude = RxnDouble();
//stream subscription position
late StreamSubscription<Position>streamSubscription;
  //isloading func
RxBool? isLoading = true.obs;

  @override
  void onInit() async {
     getpermission();
    super.onInit();
  }

//ON READY METHOD
  @override
  void onReady() async {
    try {
      Geolocator locationData = await Geolocator.getCurrentPosition().asStream().;

      latitude.value = locationData.;

      longitude.value = locationData.longitude!;
    } catch (e) {
      Get.snackbar(
        'ERROR! No location found'.tr,
        e.toString(),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
    }
    super.onReady();
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

}
