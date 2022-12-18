import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAndText extends StatelessWidget {
  final IconData icn;
  final String text;
  final Color color;
  final Color icnColor;
  const IconAndText(
      {super.key,
      required this.icn,
      required this.text,
      required this.color,
      required this.icnColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icn,
          color: icnColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.left,
          style: GoogleFonts.karla(
              fontSize: 14, color: color, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
