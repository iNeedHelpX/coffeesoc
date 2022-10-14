import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

//controller for location
class LocationController extends GetxController {
  static LocationController instance = Get.find();

  var lat = "getting latitude..".obs;
  var lon = "getting longitude..".obs;
  var address = "getting address..".obs;
  late StreamSubscription<Position> streamSubscription;
  @override
  void onInit() async {
    super.onInit();
    getlocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getlocation() async {
    bool serviceEnabled;
  }
}
