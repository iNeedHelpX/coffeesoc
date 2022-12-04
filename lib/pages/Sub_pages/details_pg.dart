import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  //the return types required when you call detailsview
  final String name;
  final String imgUrl;
  const DetailsView({super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
                        child: Image(
                            image: NetworkImage(imgUrl), fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),

                //put things here?
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: FloatingActionButton(
                mini: true,
                foregroundColor: lightgoldbg,
                hoverColor: containerback,
                backgroundColor: tabicon.withOpacity(0.8),
                onPressed: () {
                  Get.back();
                },
                child: Icon(Icons.backspace),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
