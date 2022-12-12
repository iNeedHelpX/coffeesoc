import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> bottomSheet(BuildContext context) async {
  return showModalBottomSheet(
      backgroundColor: prettyPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      context: context,
      builder: (BuildContext context) {
        //the pink/purple container that hosts the login

        return SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Replace asap Julia",
                style: GoogleFonts.courgette(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.limeAccent),
              )
            ],
          ),
        );
        //must return something here so yeah, just replace once you know what to do!
      });
}
