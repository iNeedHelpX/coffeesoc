import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/start/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsCard extends StatelessWidget {
  final String titleText;
  final String subText;

  const SettingsCard({
    super.key,
    required this.titleText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: containerback,
      onTap: () {
        // bottomSheet(context);
        Get.snackbar(
            "Pay with QR code coming soon", "check appstore for updates",
            backgroundColor: textturq,
            isDismissible: false,
            duration: Duration(seconds: 5),
            colorText: Colors.black);
      },
      child: Card(
        elevation: 5,
        child: ListTile(
          tileColor: prettyPurple,
          title: Text(titleText),
          subtitle: Text(subText),
          leading: Icon(
            Icons.qr_code_scanner,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
