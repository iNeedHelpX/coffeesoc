import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/cup_model.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapyd/models/models.dart';
import '../../colors/colours_list.dart';

class CupListing extends StatelessWidget {
  final cupController = Get.put(CupInfoController());

  CupListing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: cupController.cups.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return CupWidget(
                index: index,
                usr: loginController.userModel(),
                // cart: cartController.products[index],
                cupProd: cupController.cups[index],
                // product: cartController.products[index],
              );
            }),
      ),
    );
  }
}

//the decorated container to view the items available
class CupWidget extends StatelessWidget {
  final CupInfoController cupController = Get.find();
  // final CartItemModel cartModel;
  final int index;
  final CupModel? cupProd;
  final CustomerData? data;
  final UserModel? usr;
  // final CartItemModel cart;
  CupWidget({
    Key? key,
    required this.usr,
    required this.index,

    // required this.cart,
    required this.cupProd,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //do something functional here!
        // paymentController.checkRapydCust();
        Get.snackbar("You just tapped here!", "This is a test message!",
            backgroundColor: gold,
            duration: Duration(seconds: 4),
            colorText: Colors.black);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(
                      height: 220,
                      width: 400,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        cupController.cups[index].image!,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 10,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: textblue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "\$${cupProd!.price} ",
                            style: GoogleFonts.lilitaOne(
                                fontSize: 23, color: brighty),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: FloatingActionButton(
                        heroTag: 'tagMe$index',
                        backgroundColor: textturq2,
                        onPressed: () {
                          //buy the item
                          //cartController.addToCart(product!);
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            'assets/icons/order-now.png',
                            height: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      //headline title text
                      Text(
                        cupController.cups[index].name!,
                        style: GoogleFonts.courgette(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      //description text at bottom. white color
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          "${cupController.cups[index].info}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.karla(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
