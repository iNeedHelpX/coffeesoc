import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: lightpur,
        child: Stack(children: [
          SafeArea(
            //back button
            child: IconButton(
              onPressed: () {
                //back to home
                Get.back();
                //Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: darkgrey,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
