import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ADDRESS = "address";
  // static const PRICE = "price";

  String? id;
  String? image;
  String? name;
  String? address;
  // String? price;

  ShopModel({
    required this.id,
    this.image,
    this.name,
    this.address,
  });

  ShopModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    address = data[ADDRESS];
  }
}
