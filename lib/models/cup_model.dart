class CupModel {
  static const INFO = "info";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";

  String? info;
  String? image;
  String? name;

  String? price;

  CupModel({
    required this.info,
    this.image,
    this.name,
    this.price,
  });

  CupModel.fromMap(Map<String, dynamic> data) {
    info = data[INFO];
    image = data[IMAGE];
    name = data[NAME];
    price = data[PRICE];
  }
}
