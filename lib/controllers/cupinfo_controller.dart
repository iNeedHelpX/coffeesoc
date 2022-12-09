import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/coffeeshop_model.dart';
import 'package:coffeesoc/models/cup_model.dart';
import 'package:coffeesoc/models/user_model.dart';
import 'package:get/get.dart';

class CupInfoController extends GetxController {
  static CupInfoController instance = Get.find();
  RxList<CupModel> cups = RxList<CupModel>([]);
  String collection = "buyCoffeeCup";

  @override
  void onReady() {
    super.onReady();

    cups.bindStream(getAllProducts());
  }

//so it updates automatically as shops are added/removed
  Stream<List<CupModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => CupModel.fromMap(
                    item.data(),
                  ),
                )
                .toList(),
          );
}
