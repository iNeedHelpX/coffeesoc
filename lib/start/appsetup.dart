import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/account_page.dart';
import 'package:coffeesoc/pages/home_page.dart';
import 'package:coffeesoc/pages/map_page.dart';
import 'package:coffeesoc/start/app_bars/listbaricons.dart';
import 'package:coffeesoc/start/app_bars/radialbar.dart';

class AppSetup extends StatefulWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  AppSetupState createState() => AppSetupState();
}

class AppSetupState extends State<AppSetup> {
  int selectedpage = 1;

  final _pageOptions = [
//pages
    HomePage(),
    MapPage(),
    AccountPage(),
  ];

  CurvedNavigationBar curvedNavBar() {
    return CurvedNavigationBar(
      index: selectedpage,
      buttonBackgroundColor: containerback,
      color: barback.withOpacity(0.7),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.linearToEaseOut,
      items: listBarIcons(),
      onTap: (index) {
        setState(() {
          selectedpage =
              index; // changing selected page as per bar index selected by the user
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgoldbg,
      extendBodyBehindAppBar: true,
      appBar: myRadialBar(context),
      body: _pageOptions[selectedpage],
      extendBody: true,
      bottomNavigationBar: curvedNavBar(),
    );
  }
}
