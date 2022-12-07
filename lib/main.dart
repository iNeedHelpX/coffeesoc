import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffeesoc/controllers/login_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here. this registers the controller
    Get.put(LoginController());
  });
  runApp(Start());
}
