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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  plainBackButton(),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Your Cart",
                          style: GoogleFonts.acme(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            shadows: [
                              Shadow(
                                offset: const Offset(8, 8.0),
                                blurRadius: 17.0,
                                color: fill2.withOpacity(0.6),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

              // pinkBackButton()
            ],
          ),
        ),
      ),
    );
  }
}
