import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ClipOval customBackButton() {
  return ClipOval(
    child: Material(
      color: gold, // Button color
      child: InkWell(
        hoverColor: medpink,
        splashColor: containerback, // Splash color
        onTap: () {
          //go back to the home page
          Get.back();
          //Navigator.pop(context);
        },
        child: SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            Icons.chevron_left_rounded,
            size: 36,
          ),
        ),
      ),
    ),
  );
}
