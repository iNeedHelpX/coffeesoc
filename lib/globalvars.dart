import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeesoc/config/config.dart';
import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/controllers/rapyd_payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffeesoc/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rapyd/rapyd.dart';

// var scaffoldKey = GlobalKey<ScaffoldState>();
//firebase stuff
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

//controllers in use
LoginController loginController = LoginController.instance;
CupInfoController cupController = CupInfoController.instance;
RapydPayments paymentController = RapydPayments.instance;
// LocationController locationController = LocationController.instance;
//other variables
Logger logger = Logger();
var rapydConfig = Configurations();
var rapydClient = RapydClient(rapydConfig.rapydAccess, rapydConfig.rapydSecret);
