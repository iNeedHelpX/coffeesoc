import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage2 extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String address;
  const DetailsPage2(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.address});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: prettyPurple,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            child: Row(
              children: [backButton()],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: mediaQuery.size.height / 2.6,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.courgette(
                        fontSize: 25,
                        color: textgreyblue,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    address,
                    style: GoogleFonts.karla(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 252, 0, 105),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
