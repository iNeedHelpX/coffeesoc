import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";

  String? id;
  String? image;
  String? name;
  String? brand;
  String? price;

  ShopModel({required this.id, this.image, this.name, this.brand, this.price});

  ShopModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    image = data[IMAGE];
    name = data[NAME];
    brand = data[BRAND];
    price = data[PRICE];
  }
}
