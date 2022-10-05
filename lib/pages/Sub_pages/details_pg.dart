import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  // final String imgUrl;
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
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.backspace,
                  color: Color.fromARGB(255, 247, 0, 97),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
