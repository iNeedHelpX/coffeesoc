import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Lottie.network(
            'https://assets1.lottiefiles.com/temp/lf20_yGoGWr.json'));
  }
}
