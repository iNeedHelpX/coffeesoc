import 'package:flutter/material.dart';

RadialGradient yellowbluegradient() {
  return RadialGradient(
    center: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 255, 215, 101),
      Color.fromARGB(255, 121, 255, 183),
      Color.fromARGB(255, 62, 255, 230),
      Color.fromARGB(255, 84, 100, 255),
      Color.fromARGB(255, 126, 95, 255),
    ],
    radius: 3.1,
  );
}
