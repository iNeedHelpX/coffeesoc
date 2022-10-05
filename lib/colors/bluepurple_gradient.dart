import 'package:flutter/material.dart';

LinearGradient bluePurpleGrad() {
  return LinearGradient(colors: [
    Color.fromARGB(255, 65, 29, 255),
    Color.fromARGB(255, 93, 20, 253),
    Color.fromARGB(255, 121, 20, 238),
  ], begin: Alignment.bottomRight, end: Alignment.topLeft);
}
