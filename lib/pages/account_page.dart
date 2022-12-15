import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/widgets/custom_button.dart';
import 'package:coffeesoc/pages/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.courgette(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 93, 92, 103)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: containerback,
                    onTap: () {
                      //do something
                      Get.snackbar("test", "this is a test",
                          duration: Duration(seconds: 1),
                          backgroundColor: Color.fromARGB(255, 255, 0, 136));
                    },
                    child: SettingCards(
                      icon: Icon(
                        Icons.curtains,
                        size: 40,
                        color: Colors.black,
                      ),
                      titleText: 'Test',
                      subText: 'change later Julia!',
                    ),
                  ),

                  InkWell(
                    splashColor: containerback,
                    onTap: () {
                      //do something
                      Get.snackbar(
                        "test",
                        "this is a test",
                        duration: Duration(seconds: 1),
                      );
                    },
                    child: SettingCards(
                      icon: Icon(
                        Icons.credit_card_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                      titleText: 'Credit card',
                      subText: 'add/view your credit card info',
                    ),
                  ),
                  InkWell(
                    splashColor: containerback,
                    onTap: () {
                      //do something
                      Get.snackbar(
                        "ORDER HISTORY TEST",
                        "this is a test",
                        backgroundColor: medpink,
                        duration: Duration(seconds: 1),
                      );
                    },
                    child: SettingCards(
                      icon: Icon(
                        Icons.history,
                        size: 40,
                        color: Colors.black,
                      ),
                      titleText: 'Order History',
                      subText: 'view order history',
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: "Logout",
                      bgColor: prettyPurple,
                      onTap: () {
                        loginController.signOut();
                      }),

                  // PurpleLogout(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PurpleLogout extends StatelessWidget {
  const PurpleLogout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent, // background
        foregroundColor: gold,
        // foreground
      ),
      onPressed: () {
        loginController.signOut();
        // authController.signOut();
      },
      child: Text('Logout'),
    );
  }
}
