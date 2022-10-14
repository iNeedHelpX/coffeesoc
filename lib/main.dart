import 'package:coffeesoc/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffeesoc/controllers/cart_controller.dart';
import 'package:coffeesoc/controllers/login_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here
    Get.put(LoginController());
    Get.put(CartController());
  });
  runApp(Start());
}
