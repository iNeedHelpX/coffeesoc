import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightpur,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
            children: [
              InkWell(
                // Splash color
                splashColor: lightgoldbg,
                onTap: () {
                  //go back to the home page
                  Get.back();
                  //Navigator.pop(context);
                },

                child: Icon(
                  Icons.chevron_left_rounded,
                  color: greytext,
                  size: 36,
                ),
              ),
              // pinkBackButton()
            ],
          ),
        ),
      ),
    );
  }
}
