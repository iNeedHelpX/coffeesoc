import 'package:flutter/material.dart';

class RecommendIcn extends StatelessWidget {
  const RecommendIcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(
          'assets/icons/rec.png',
          height: 25,
        ));
  }
}
