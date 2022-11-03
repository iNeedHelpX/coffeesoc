import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';

class LoginPage extends StatelessWidget {
  // final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradients.octoberSilence(tileMode: TileMode.clamp),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      gradient: FlutterGradients.coldEvening(
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "No need to register just sign in with Google",
                          textAlign: TextAlign.center,
                          //style info next
                          style: GoogleFonts.fjallaOne(
                            color: brighty,
                            fontSize: 32,
                          ),
                        ),
                        //buffer space
                        SizedBox(
                          height: 20,
                        ),
                        SignInButton(
                          Buttons.Google,
                          onPressed: () {
                            loginController.googleLogin();
                            //sign in logic goes here
                            // authController.googleLogin(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
