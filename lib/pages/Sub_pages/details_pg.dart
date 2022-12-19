import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  //the return types required when you call detailsview
  final String name;
  final String imgUrl;

  const DetailsView({super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: prettyPurple,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height / 2.5,
                        child: Image(
                            image: NetworkImage(imgUrl), fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),

                //put things here?
              ],
            ),
            backButton(),
          ],
        ),
      ),
    );
  }
}
