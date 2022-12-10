import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const whitedescripttext = GoogleFonts.karla(
    fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);

var text = Text(
  "${cupController.cups[index].info}",
  textAlign: TextAlign.center,
  style: GoogleFonts.karla(
      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
);
