import 'package:coffeesoc/config/config.dart';
import 'package:coffeesoc/controllers/cupinfo_controller.dart';
import 'package:coffeesoc/globalvars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rapyd/models/customer.dart';
import 'package:rapyd/rapyd.dart';

//process payment
class RapydPayments extends GetxController {
  static RapydPayments instance = Get.find();
  static CupInfoController cupController = Get.find();
  int? index = 0;
  Customer? customers;
  CustomerData? _cust;
  CustomerData? get customer => _cust;
  Rxn<User> fbUser = Rxn<User>();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

//check if rapydClient
  void checkRapydCust() async {
    final customer = await getCustomer(rapydClient);
    //check if the customer is already registered
    if (customer.data.email == auth.currentUser!.email) {
      print("hello you are already registered! ${auth.currentUser!.email}");
      return;
    } else if (customer.data.email != auth.currentUser!.email) {
      print(
          "${customer.data.email} is going to be registered on rapyd payment");
      createRapydCustomer();
    }
  }

  void createRapydCustomer() async {
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
    print("${customer.data.email}");
    print("${cupController.cups[index!].price!}");
    try {
      // need to create payment here
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
