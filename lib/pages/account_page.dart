import 'package:coffeesoc/colors/colours_list.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/pages/widgets/custom_button.dart';
import 'package:coffeesoc/start/bottomsheet.dart';
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
                  GestureDetector(
                    onTap: () {
                      bottomSheet(context);
                    },
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: prettyPurple,
                        title: Text('QR card'),
                        subtitle: Text("pay with qrcode"),
                        leading: Icon(
                          Icons.qr_code_scanner,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
