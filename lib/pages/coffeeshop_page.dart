import 'package:coffeesoc/pages/widgets/cup_listing.dart';
import 'package:coffeesoc/pages/widgets/listings_widget.dart';
import 'package:coffeesoc/pages/widgets/neurobox.dart';
import 'package:flutter/material.dart';

class CoffeeCupPage extends StatelessWidget {
  const CoffeeCupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeuromorphicBox(
                  boomtitle: 'Shop listings',
                  subtext: 'This is the listings section',
                ),
                SizedBox(
                  height: 20,
                ),
                CupListing(),
                //nearby shops
                CoffeeShopList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
