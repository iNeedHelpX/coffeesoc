import 'package:coffeesoc/config/config.dart';
import 'package:coffeesoc/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffeesoc/controllers/login_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/start/start.dart';
import 'package:rapyd/rapyd.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here. this registers the controller
    Get.put(LoginController());
    Get.put(PaymentController());
  });
  runApp(Start());
}
