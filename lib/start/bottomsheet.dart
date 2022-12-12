import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        //the purple pop up container

        return SafeArea(
          //column is centered btw!
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //replace this text here with something else later!
              Text(
                "Replace ASAP ${auth.currentUser!.displayName}",
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
