import 'package:flutter/material.dart';

class PandaIcn extends StatelessWidget {
  const PandaIcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(
          'assets/icons/panda.png',
          height: 25,
        ));
  }
}
