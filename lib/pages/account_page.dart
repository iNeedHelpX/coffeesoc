import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
                    height: 30,
                  ),
                  CustomButton(
                      text: "Logout",
                      bgColor: medpink,
                      onTap: () {
                        loginController.signOut();
                      }),
                  //logout button
                  ElevatedButton(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
