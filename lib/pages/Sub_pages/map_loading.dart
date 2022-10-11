import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Loading map, please wait..',
          style: GoogleFonts.dancingScript(
              fontSize: 26, fontWeight: FontWeight.w500, color: brightpink),
        ),
      ),
    );
  }
}
