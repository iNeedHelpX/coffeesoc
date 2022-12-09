import 'package:coffeesoc/config/config.dart';
import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/cup_model.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rapyd/models/card_payment.dart';
import 'package:rapyd/models/checkout.dart';
import 'package:rapyd/models/customer.dart';
import 'package:rapyd/rapyd.dart';

//process payment
class PaymentController extends GetxController {
  static PaymentController instance = Get.find();
  static CupInfoController cupController = Get.find();
  RxList<CupModel> cups = RxList<CupModel>([]);
  String collection = "buyCoffeeCup";
  int index = 0;
  get price => cupController.cups[index].price;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  createRapydCustomer() async {
    final rapydClient =
        RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);

    try {
      final customer = await getCustomer(rapydClient);

      print('Created customer successfully, name: ${customer.data.name}');
      if (customer.data.email == auth.currentUser!.email!) return;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<Customer> getCustomer(RapydClient rapydClient) async {
    return await rapydClient.createNewCustomer(
      email: auth.currentUser!.email!,
      name: auth.currentUser!.displayName!,
    );
  }
}
