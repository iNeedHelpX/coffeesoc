import 'package:coffeesoc/config/config.dart';
import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/cup_model.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:get/get.dart';
import 'package:rapyd/models/customer.dart';
import 'package:rapyd/rapyd.dart';

//process payment
class RapydPayments extends GetxController {
  static RapydPayments instance = Get.find();
  static CupInfoController cupController = Get.find();
  RxList<CupModel> cups = RxList<CupModel>([]);
  String collection = "buyCoffeeCup";
  int? index;
  // get price => cupController.cups[index].price;
  CustomerData? _cust;
  CustomerData? get customer => _cust;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

//check if rapydClient
  void checkRapydCust(UserModel usr) async {
    final customer = await getCustomer(rapydClient);
    if (customer.data.email != usr.email) {
      print("${usr.email}");
      print("hi");
    } else if (customer.data.email == usr.email) {
      print("${customer.data.email}");
      createRapydCustomer();
    }
  }

  createRapydCustomer() async {
    final rapydClient =
        RapydClient(Configurations().rapydAccess, Configurations().rapydSecret);

    try {
      final customer = await getCustomer(rapydClient);

      print('Created customer successfully, name: ${customer.data.id}');
      if (customer.data.email == auth.currentUser!.email!) return;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  void createPayment() async {
    final customer = await getCustomer(rapydClient);

    try {
      final pay = await rapydClient.createCheckout(
          amount: cupController.cups[index!].price!,
          currency: 'usd',
          countryCode: 'us',
          customerId: customer.data.id);
      print('Payment successful, amount: ${cupController.cups[index!].price!}');
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
