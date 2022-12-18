import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';

class DetailsPage2 extends StatelessWidget {
  final String imgUrl;
  const DetailsPage2({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prettyPurple,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
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
          )
        ],
      ),
    );
  }
}
