import 'package:coffeesoc/pages/mapview_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/account_page.dart';
import 'package:coffeesoc/pages/coffeeshop_page.dart';
import 'package:coffeesoc/start/app_bars/listbaricons.dart';
import 'package:coffeesoc/start/app_bars/radialbar.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:new_version/new_version.dart';

class AppSetup extends StatefulWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  AppSetupState createState() => AppSetupState();
}

class AppSetupState extends State<AppSetup> {
  int selectedpage = 1;

  final _pageOptions = [
//pages
    // PandaPage(),
    CoffeeCupPage(),
    MapsPage2(),
    AccountPage(),
  ];
  @override
  void initState() {
    super.initState();
    _checkVersion();
  }

  CurvedNavigationBar curvedNavBar() {
    return CurvedNavigationBar(
      index: selectedpage,
      buttonBackgroundColor: containerback,
      color: barback.withOpacity(0.7),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
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
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradients.confidentCloud(
          type: GradientType.linear,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: myRadialBar(context),
        body: _pageOptions[selectedpage],
        extendBody: true,
        bottomNavigationBar: curvedNavBar(),
      ),
    );
  }

  void _checkVersion() {
    final newVersion = NewVersion(
      androidId: "com.juliapak.coffeesoc",
      iOSId: "com.juliapak.coffeesoc",
    );
    newVersion.showAlertIfNecessary(context: context);
  }
}
