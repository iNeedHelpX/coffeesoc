import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prettyPurple,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                plainBackButton(),
                Center(
                  child: Text("Your Cart"),
                )
              ],
            )),
      ),
    );
  }
}
