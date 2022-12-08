import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/models/cup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // final CartItemModel cart;
  CupWidget({
    Key? key,
    required this.index,
    // required this.cart,
    required this.cupProd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // this is where you put the get.to the details page
        //looks like this:
        // Get.to(() => DetailsView(
        //       imgUrl: cupProd!.image!,
        //       name: cupProd!.name!,
        //     ));
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
                              color: Color.fromARGB(255, 255, 0, 161),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "\$${cupController.cups[index].price} ",
                            style: GoogleFonts.lilitaOne(
                                fontSize: 23, color: Colors.white),
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
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            'assets/icons/buy.png',
                            height: 25,
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
                      Text(
                        cupController.cups[index].name!,
                        style: GoogleFonts.courgette(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${cupController.cups[index].info}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.karla(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
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
