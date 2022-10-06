import 'package:flutter/material.dart';

class MapIcn extends StatelessWidget {
  const MapIcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(
          'assets/icons/map.png',
          height: 24,
        ));
  }
}
