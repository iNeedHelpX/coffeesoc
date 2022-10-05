import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradients.confidentCloud(
          type: GradientType.linear,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
                    decoration: BoxDecoration(
                      gradient: FlutterGradients.coldEvening(
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "No need to register. Just sign in with Google!",
                          //style info next
                          style: GoogleFonts.fjallaOne(
                            color: textgreyblue,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        //buffer space
                        const SizedBox(
                          height: 20,
                        ),
                        SignInButton(
                          elevation: 4,
                          text: "Sign in with Google",
                          padding: EdgeInsets.all(1),
                          Buttons.GoogleDark,
                          onPressed: () {
                            //sign in logic goes here
                            loginController.googleLogin();
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
