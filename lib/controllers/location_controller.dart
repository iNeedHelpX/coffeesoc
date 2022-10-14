import 'package:get/get.dart';

//controller for location
class LocationController extends GetxController {
  static LocationController instance = Get.find();

  var lat = "getting latitude..".obs;
  var lon = "getting longitude..".obs;
  var address = "getting address..".obs;

  @override
  void onReady() {
    super.onReady();
  }
}
