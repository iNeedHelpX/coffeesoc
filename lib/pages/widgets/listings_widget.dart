import 'package:coffeesoc/controllers/shop_controller.dart';
import 'package:coffeesoc/models/coffeeshop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/colours_list.dart';

class CoffeeShop extends StatelessWidget {
  final productController = Get.put(ShopController());

  CoffeeShop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: productController.shops.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return CoffeeListingWidget(
                index: index,
                // cart: cartController.products[index],
                product: productController.shops[index],
                // product: cartController.products[index],
              );
            }),
      ),
    );
  }
}

//the decorated container to view the items available
class CoffeeListingWidget extends StatelessWidget {
  final ShopController productController = Get.find();
  // final CartItemModel cartModel;
  final int index;
  final ShopModel? product;
  // final CartItemModel cart;
  CoffeeListingWidget({
    Key? key,
    required this.index,
    // required this.cart,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: textblue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(
                    height: 250,
                    width: 400,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      productController.shops[index].image!,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      productController.shops[index].name!,
                      style:
                          GoogleFonts.lemon(fontSize: 34, color: lightgoldbg),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "from: ${productController.shops[index].brand}",
                      style:
                          GoogleFonts.karla(fontSize: 16, color: Colors.white),
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
    );
  }
}
