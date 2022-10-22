import 'package:coffeesoc/pages/panda_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/account_page.dart';
import 'package:coffeesoc/pages/home_page.dart';
import 'package:coffeesoc/pages/map_page.dart';
import 'package:coffeesoc/start/app_bars/listbaricons.dart';
import 'package:coffeesoc/start/app_bars/radialbar.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
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
    PandaPage(),
    HomePage(),
    MapPage(),
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
      animationCurve: Curves.bounceInOut,
      items: listBarIcons(),
      onTap: (index) {
        setState(() {
          selectedpage =
              index; // changing selected page as per bar index selected by the user
        });
      },
    );
  }

  JumpingTabBar jumpingBar() {
    return JumpingTabBar(
      items: [
        TabItemIcon(
          startColor: Colors.red,
          endColor: Colors.green,
          curveColor: Colors.yellow,
        ),
      ],
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
