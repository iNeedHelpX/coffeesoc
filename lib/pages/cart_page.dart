import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prettyPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          plainBackButton(),
                          SizedBox(
                            width: 70,
                          ),
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
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
