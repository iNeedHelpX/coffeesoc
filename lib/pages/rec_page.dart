import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PandaPage extends StatelessWidget {
  const PandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Hello ${auth.currentUser!.displayName}",
                    style: GoogleFonts.cabin(
                        fontSize: 22,
                        color: Color.fromARGB(255, 253, 1, 152),
                        fontWeight: FontWeight.w800),
                  ),
                ),
                NeuromorphicBox(
                    boomtitle: "Recommended by others",
                    subtext:
                        "${auth.currentUser!.displayName}, check out shops visited by other people in your network"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
