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

        return Text('need to replace asap julia');
        //must return something here so yeah, just replace once you know what to do!
      });
}
