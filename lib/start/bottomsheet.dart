import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/colors/radial_gradient.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

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
                height: 10,
              ),
              //replace this text here with something else later!
              Text(
                "Your QR code ${auth.currentUser!.displayName} :",
                style: GoogleFonts.courgette(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.limeAccent),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: yellowGreenGradient()),
                child: PrettyQr(
                  image: AssetImage('assets/icons/cup.png'),
                  size: 300,
                  data: 'https://www.google.ca',
                  errorCorrectLevel: QrErrorCorrectLevel.H,
                  typeNumber: 9,
                ),
              )
            ],
          ),
        );
        //must return something here so yeah, just replace once you know what to do!
      });
}
