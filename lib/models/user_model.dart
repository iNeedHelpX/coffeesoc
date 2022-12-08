import 'package:coffeesoc/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeesoc/models/review_model.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";
  static const PHOTOURL = "photoURL";
  static const REVIEWS = "reviews";

  String? id;
  String? name;
  String? email;
  String? photoURL;
  List<CartItemModel>? cart;
  List<ReviewModel>? reviews;

  UserModel({
    this.id,
    this.photoURL,
    this.email,
    this.name,
    this.cart,
    this.reviews,
  });

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    name = snapshot.data()?['NAME'] ?? '';
    email = snapshot.data()?['EMAIL'] ?? '';
    photoURL = snapshot.data()?['PHOTOURL'] ?? '';
    id = snapshot.data()?['ID'] ?? '';
    cart = _convertCartItems(snapshot.data()?['CART'] ?? []);
    // reviews = _convertCartItems(snapshot.data()?['REVIEWS'] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> result = [];
    if (cartFomDb.isNotEmpty) {
      for (var element in cartFomDb) {
        result.add(CartItemModel.fromMap(element));
      }
    }
    return result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();

  Map<String, dynamic> toJson() => {
        "uid": id,
        "email": email,
        "name": name,
        "photoUrl": photoURL,
        "cart": cart,
        "reviews": reviews,
      };
}
