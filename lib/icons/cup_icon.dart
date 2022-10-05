import 'package:flutter/material.dart';

//cup icon
class CupIcon extends StatelessWidget {
  const CupIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/cup.png',
          height: 25,
        ));
  }
}
