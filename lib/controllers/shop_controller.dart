import 'package:coffeesoc/globalvars.dart';
import 'package:coffeesoc/models/coffeeshop_model.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static ShopController instance = Get.find();
  RxList<ShopModel> shops = RxList<ShopModel>([]);
  String collection = "coffeeshops";

  @override
  void onReady() {
    super.onReady();

    shops.bindStream(getAllProducts());
  }

  Stream<List<ShopModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => ShopModel.fromMap(
                    item.data(),
                  ),
                )
                .toList(),
          );
}
