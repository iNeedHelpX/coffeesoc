import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/pages/widgets/custombackbutton.dart';
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
            backButton(),
          ],
        ),
      ),
    );
  }

  Padding backButton() {
    return Padding(
        padding: const EdgeInsets.only(left: 15, top: 40),
        child: ClipOval(
          child: Material(
            color: prettyPurple, // Button color
            child: InkWell(
              splashColor: tabicon, // Splash color
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.chevron_left_outlined,
                  color: greytext2,
                ),
              ),
            ),
          ),
        ));
  }
}
