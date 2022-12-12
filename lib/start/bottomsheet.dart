import 'package:coffeesoc/colors/colours_list.dart';
import 'package:flutter/material.dart';

Future<dynamic> bottomSheet(BuildContext context) async {
  return showModalBottomSheet(
      backgroundColor: prettyPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      context: context,
      builder: (BuildContext context) {
        //the pink/purple container that hosts the login

        return SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Replace asap Julia")
            ],
          ),
        );
        //must return something here so yeah, just replace once you know what to do!
      });
}
