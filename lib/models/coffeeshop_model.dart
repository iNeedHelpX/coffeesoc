import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const ADDRESS = "address";
  static const DESCRIPTION = "description";
  static const SEATS = "seats";
  // static const PRICE = "price";

  String? id;
  String? image;
  String? name;
  String? address;
  String? description;
  int? seats;
  // String? price;

  ShopModel(
      {required this.id,
      this.image,
      this.seats,
      this.name,
      this.address,
      this.description});

  ShopModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    address = data[ADDRESS];
    description = data[DESCRIPTION];
    seats = data[SEATS];
  }
}
