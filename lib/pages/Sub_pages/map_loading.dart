import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text(
              'Loading map, please wait..',
              style: GoogleFonts.dancingScript(
                  fontSize: 26, fontWeight: FontWeight.w500, color: brightpink),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            color: tabicon,
          )
        ],
      ),
    );
  }
}
