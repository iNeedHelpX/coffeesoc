import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/back_button.dart';
import 'package:coffeesoc/pages/widgets/icons_textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
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
            bottom: 0,
            top: mediaQuery.size.height / 2.7,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: FlutterGradients.kindSteel(tileMode: TileMode.clamp),
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
                    "Seating: 20",
                    style: GoogleFonts.karla(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 248, 2, 145),
                    ),
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          icn: Icons.reviews_sharp,
                          text: "Reviews",
                          color: textblue2,
                          icnColor: orangetext),
                      IconAndText(
                          icn: Icons.favorite,
                          text: "Add to favorite",
                          color: Colors.black,
                          icnColor: Color.fromARGB(255, 252, 6, 92)),
                      IconAndText(
                          icn: Icons.pin_drop,
                          text: "GoogleMaps",
                          color: tabicon,
                          icnColor: Color.fromARGB(255, 11, 144, 49)),
                    ],
                  ),
                  Text(
                    address,
                    style: GoogleFonts.karla(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: barback,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              decoration: BoxDecoration(
                gradient:
                    FlutterGradients.sleeplessNight(tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
