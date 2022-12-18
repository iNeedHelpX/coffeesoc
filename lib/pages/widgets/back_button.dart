import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/colours_list.dart';

Padding backButton() {
  return Padding(
      padding: const EdgeInsets.only(left: 15, top: 40),
      child: ClipOval(
        child: Material(
          color: prettyPurple, // Button color
          child: InkWell(
            splashColor: tabicon, // Splash color
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.chevron_left_rounded,
                size: 38,
                color: lightgoldbg,
              ),
            ),
          ),
        ),
      ));
}
